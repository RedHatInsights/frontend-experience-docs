# Testing Guidelines

Guidelines for writing and running tests in chrome-service-backend.

## Running Tests

```bash
# Run all tests with coverage
make test

# Run a specific package
go test -v ./rest/service/
go test -v ./rest/routes/

# Run a specific test function
go test -v -run TestGetAllUserDashboardTemplates ./rest/service/

# View coverage report
make test
make coverage
```

## Test Database Setup

Tests use SQLite instead of PostgreSQL. Each test package with database access must implement a `TestMain` function:

```go
func TestMain(m *testing.M) {
    cfg := config.Get()
    cfg.Test = true
    cfg.DashboardConfig.TemplatesWD = "../../"  // Adjust relative path as needed
    now := time.Now().UnixNano()
    dbName := fmt.Sprintf("%d-services.db", now)
    config.Get().DbName = dbName

    database.Init()
    err := database.DB.AutoMigrate(&models.UserIdentity{}, &models.YourModel{})
    if err != nil {
        panic(err)
    }

    exitCode := m.Run()

    os.Remove(dbName)
    os.Exit(exitCode)
}
```

### Key Points

- **`cfg.Test = true`** — Switches `database.Init()` to SQLite mode
- **`cfg.DashboardConfig.TemplatesWD`** — Must point to the repo root relative to the test file location (e.g., `../../` from `rest/service/`)
- **Timestamped DB name** — Prevents conflicts when tests run in parallel across packages
- **AutoMigrate** — Create only the tables needed for your tests
- **Cleanup** — Always `os.Remove(dbName)` after tests complete

## Writing Tests

### Structure

Use table-driven subtests with descriptive names:

```go
func TestMyFeature(t *testing.T) {
    t.Run("Should return items for valid user", func(t *testing.T) {
        // Arrange
        user := models.UserIdentity{AccountId: "test-user"}
        database.DB.Create(&user)

        // Act
        result, err := service.GetItems(user.ID)

        // Assert
        assert.Nil(t, err)
        assert.NotNil(t, result)
        assert.Equal(t, 1, len(result))
    })

    t.Run("Should return empty array for user with no items", func(t *testing.T) {
        // ...
    })

    t.Run("Should return error for invalid input", func(t *testing.T) {
        // ...
    })
}
```

### Assertions

Use `testify/assert` consistently:

```go
assert.Nil(t, err)                          // No error
assert.NotNil(t, result)                    // Non-nil result
assert.Equal(t, expected, actual)           // Equality
assert.True(t, condition)                   // Boolean check
assert.Contains(t, slice, element)          // Slice/string contains
assert.True(t, errors.Is(err, gorm.ErrRecordNotFound))  // Error type
```

### Test Data

- Create test data directly with `database.DB.Create(&model)`
- Use package-level variables for shared test fixtures (initialized in `TestMain` or setup functions)
- Don't rely on data from other test functions — each test should set up its own state or use shared fixtures

### What to Test

For each endpoint or service function, test:

1. **Happy path** — Valid input returns expected result
2. **Empty results** — User with no data returns empty array (not nil)
3. **Not found** — Requesting non-existent resource returns appropriate error
4. **Authorization** — User cannot access another user's resources
5. **Invalid input** — Bad request body returns error
6. **Edge cases** — Nil fields, empty strings, zero values

## Test File Locations

Test files are co-located with source files:

```
rest/service/dashboardTemplate.go       → rest/service/dashboardTemplate_test.go
rest/service/favoritePageService.go     → rest/service/favoritePageService_test.go
rest/routes/dashboardTemplate.go        → rest/routes/dashboardTemplate_test.go
rest/models/DashboardTemplate.go        → rest/models/DashboardTemplate_test.go
rest/util/user_identity_cache.go        → rest/util/user_identity_cache_test.go
```

## Existing Test Packages

The following packages have existing `TestMain` setups:

- `rest/service/` — Dashboard template tests with full mock data
- `rest/routes/` — Route handler tests with HTTP request/response testing
- `rest/models/` — Model validation tests
- `rest/util/` — Utility function tests
- `rest/featureflags/` — Feature flag tests
- `cmd/services/` — Service parser tests
