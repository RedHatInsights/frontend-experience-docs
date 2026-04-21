# API Development Guidelines

Guidelines for adding or modifying REST API endpoints in chrome-service-backend.

## Adding a New Endpoint

### 1. Define the Model

Create a new model file in `rest/models/` if needed. Embed `BaseModel` for standard fields:

```go
package models

type MyResource struct {
    BaseModel
    UserIdentityID uint   `json:"userIdentityId"`
    Name           string `json:"name"`
}
```

### 2. Create the Service Layer

Add business logic in `rest/service/`. Services interact with `database.DB` (GORM) and should not handle HTTP concerns:

```go
package service

func GetMyResources(userID uint) ([]models.MyResource, error) {
    var resources []models.MyResource
    err := database.DB.Where("user_identity_id = ?", userID).Find(&resources).Error
    return resources, err
}
```

### 3. Create Route Handlers

Add HTTP handlers in `rest/routes/`. Follow the existing pattern:

```go
package routes

func GetMyResource(w http.ResponseWriter, r *http.Request) {
    user := r.Context().Value(util.USER_CTX_KEY).(models.UserIdentity)
    resources, err := service.GetMyResources(user.ID)
    if err != nil {
        logrus.WithError(err).Error("failed to get resources")
        http.Error(w, "internal server error", http.StatusInternalServerError)
        return
    }
    response := util.ListResponse[models.MyResource]{
        Data: resources,
        Meta: util.ListMeta{Count: len(resources), Total: len(resources)},
    }
    json.NewEncoder(w).Encode(response)
}

func MakeMyResourceRoutes(sub chi.Router) {
    sub.Get("/", GetMyResource)
    sub.Post("/", CreateMyResource)
}
```

### 4. Mount the Route

In `main.go`, add the route inside the authenticated subrouter:

```go
subrouter.Route("/my-resource", routes.MakeMyResourceRoutes)
```

### 5. Register the Table

In `rest/database/db.go`, add migration for the new model in `Init()`:

```go
if !DB.Migrator().HasTable(&models.MyResource{}) {
    DB.Migrator().CreateTable(&models.MyResource{})
}
```

## Conventions

### Authentication

All endpoints under `/api/chrome-service/v1/` are protected by two middleware:

1. **ParseHeaders** — Decodes `x-rh-identity` base64 header into `identity.XRHID`
2. **InjectUser** — Resolves or creates `UserIdentity` in DB, injects into request context

Access user identity in handlers via:
```go
user := r.Context().Value(util.USER_CTX_KEY).(models.UserIdentity)
```

### Response Format

Use the generic response types from `rest/util/responses.go`:

- **List responses**: `util.ListResponse[T]` with `Data` (slice) and `Meta` (count/total)
- **Single item responses**: `util.EntityResponse[T]` with `Data` (single model)

### Error Handling

- Return `http.StatusBadRequest` (400) for invalid request bodies
- Return `http.StatusForbidden` (403) for missing authentication
- Return `http.StatusNotFound` (404) for missing resources
- Reserve `panic()` strictly for application startup failures (e.g., `database.Init()`) — never in request handlers. Return an HTTP error response instead
- Use structured logging via `logrus` for error context

### Naming

- Model files: `PascalCase.go` (e.g., `FavoritePage.go`)
- Service files: `camelCaseService.go` (e.g., `favoritePageService.go`)
- Route files: `camelCase.go` (e.g., `favoritePage.go`)
- Route constructors: `MakeXxxRoutes(sub chi.Router)`
- URL paths: kebab-case (e.g., `/favorite-pages`, `/dashboard-templates`)

### Database

- Use GORM for all database operations via the global `database.DB`
- Models use soft delete via `gorm.DeletedAt` in `BaseModel`
- Use `database.DB.Where(...).Find(...)` for queries, `database.DB.Create(...)` for inserts
- Use `database.DB.Model(&record).Update(...)` for single-field updates
- Use `database.DB.Model(&record).Updates(...)` for multi-field updates

## Testing New Endpoints

1. Add tests in `rest/routes/` or `rest/service/` as `*_test.go` files
2. If the test package already has a `TestMain`, use the existing DB setup
3. If creating a new test package with DB access, implement `TestMain` following the pattern in `rest/routes/main_test.go`
4. Create test data directly with `database.DB.Create()`
5. Use `testify/assert` for all assertions
6. Test both success and error paths (missing resources, unauthorized access, invalid input)
