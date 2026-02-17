# Learning Resources Creator Guide

> Complete guide for creating learning resources using the Wizard and YAML Editor

**Version:** 1.0
**Last Updated:** February 2026

## Table of Contents

- [Overview](#overview)
- [Creator Tool Modes](#creator-tool-modes)
  - [Wizard Mode](#wizard-mode)
  - [YAML Editor Mode](#yaml-editor-mode)
  - [Switching Between Modes](#switching-between-modes)
- [Learning Resource Types](#learning-resource-types)
  - [Quick Starts](#quick-starts)
  - [Learning Paths](#learning-paths)
  - [Documentation](#documentation)
  - [Other Resources](#other-resources)
  - [Type Comparison](#type-comparison)
- [Creating Resources with the Wizard](#creating-resources-with-the-wizard)
  - [Creating a Quick Start](#creating-a-quick-start)
  - [Creating a Learning Path](#creating-a-learning-path)
  - [Creating Documentation](#creating-documentation)
  - [Creating Other Resources](#creating-other-resources)
- [Creating Resources with YAML Editor](#creating-resources-with-yaml-editor)
  - [YAML Structure](#yaml-structure)
  - [Quick Start YAML Template](#quick-start-yaml-template)
  - [Learning Path YAML Template](#learning-path-yaml-template)
  - [Documentation YAML Template](#documentation-yaml-template)
  - [Other Resource YAML Template](#other-resource-yaml-template)
- [Common Fields Reference](#common-fields-reference)
- [Live Preview](#live-preview)
- [Downloading and Submitting](#downloading-and-submitting)
- [Best Practices](#best-practices)

---

## Overview

The **Learning Resources Creator** is an admin tool for creating and managing learning content in the Red Hat Hybrid Cloud Console. It provides two ways to create resources:

1. **Wizard Mode** - A guided, multi-step form for creating resources without writing YAML
2. **YAML Editor Mode** - Direct YAML editing with Monaco Editor for advanced users

Both modes include a **live preview** that shows exactly how the resource card will appear to users.

**Access:** https://console.stage.redhat.com/learning-resources/creator (requires `platform.chrome.quickstarts.creator` feature flag and permissions)

---

## Creator Tool Modes

### Wizard Mode

The Wizard provides a step-by-step form interface using Data Driven Forms, making it easy to create resources without YAML knowledge.

**Features:**
- Multi-step guided workflow
- Form validation and error messages
- Dynamic fields based on resource type
- Auto-generates YAML from form inputs
- Built-in help text for each field

**When to Use:**
- You're new to learning resources
- You want validation and guidance
- You're creating Quick Starts with multiple tasks
- You prefer forms over code

**Wizard Components:** `src/components/creator/CreatorWizard.tsx`

The Creator component orchestrates the wizard flow through the `CreatorInternal` component, managing quickstart state, bundles, tags, and current wizard stage. The wizard uses `@data-driven-forms/react-form-renderer` with custom component mappers for specialized inputs like tag selection and duration pickers.

### YAML Editor Mode

The YAML Editor provides direct access to the YAML structure with syntax highlighting and Monaco Editor features.

**Features:**
- Full Monaco Editor with IntelliSense
- Syntax highlighting for YAML
- Real-time validation
- Direct editing of generated YAML
- Copy/paste support

**When to Use:**
- You're familiar with the YAML structure
- You want full control over the output
- You're copying from existing resources
- You need to make quick edits
- You're creating variations of existing content

**Editor Component:** `src/components/creator/CreatorYAMLView.tsx:197-215`

```typescript
<Editor
  height="100%"
  language="yaml"
  theme="vs"
  value={yamlContent}
  onChange={handleEditorChange}
  beforeMount={configureMonacoEnvironment}
  options={{
    automaticLayout: true,
    minimap: { enabled: true },
    scrollBeyondLastLine: false,
    wordWrap: 'on',
    fontSize: 14,
    lineNumbers: 'on',
    folding: true,
    renderWhitespace: 'selection',
  }}
/>
```

### Switching Between Modes

You can switch between Wizard and YAML modes at any time:

1. **Wizard → YAML:** Click "YAML View" tab to see generated YAML
2. **YAML → Wizard:** Click "Wizard View" tab (Note: manual YAML edits may be lost)

**Important:** The Wizard is the source of truth. If you edit YAML manually and switch back to Wizard, your manual changes may be overwritten by the form data.

---

## Learning Resource Types

The Creator supports four distinct types of learning resources, each with different purposes, structures, and user interactions.

### Quick Starts

**Purpose:** Interactive, step-by-step tutorials that guide users through workflows in the console.

**Visual Identity:**
- Badge Color: **Green**
- Badge Text: "Quick start"

**Key Features:**
- Task-based progression (1-10 tasks)
- Duration estimate (1-90 minutes)
- Introduction panel with prerequisites
- Work validation/review for each task
- Activates in Chrome side panel

**When to Create:**
- Teaching a specific workflow or procedure
- Guiding users through console features
- Providing hands-on learning with validation
- Creating interactive training content

**User Experience:**
- Clicks resource card → Opens side panel in console
- Reads introduction and prerequisites
- Works through tasks one by one
- Marks tasks complete after validation
- Can minimize/maximize panel while working

**Example Use Cases:**
- "Create your first cluster"
- "Deploy an application with OpenShift"
- "Configure role-based access control"
- "Set up monitoring and alerts"

---

### Learning Paths

**Purpose:** Curated collections of learning materials organized around a common theme or learning goal.

**Visual Identity:**
- Badge Color: **Cyan**
- Badge Text: "Learning path"

**Key Features:**
- External URL to learning path content
- No tasks or duration
- Simple description and link
- Grouped presentation of multiple resources

**When to Create:**
- Organizing multiple resources by topic
- Creating curriculum for a skill area
- Linking to external training platforms
- Curating a learning journey

**User Experience:**
- Clicks resource card → Opens external URL in new tab
- Views curated collection outside console
- May include multiple courses, videos, docs

**Example Use Cases:**
- "OpenShift Administrator Learning Path"
- "Ansible Automation Learning Journey"
- "Red Hat Certified Specialist Track"
- "Security Best Practices Path"

---

### Documentation

**Purpose:** Links to official technical documentation for Red Hat products and services.

**Visual Identity:**
- Badge Color: **Orange**
- Badge Text: "Documentation"

**Key Features:**
- External URL to documentation
- Shows hostname on card
- No tasks or duration
- Reference material focus

**When to Create:**
- Linking to official product docs
- Providing API references
- Sharing technical specifications
- Directing to knowledge base articles

**User Experience:**
- Clicks resource card → Opens documentation in new tab
- Card shows the documentation hostname (e.g., "access.redhat.com")
- Standard documentation reading experience

**Example Use Cases:**
- "OpenShift Container Platform Documentation"
- "Ansible Tower API Reference"
- "RHEL System Administration Guide"
- "Identity Management Documentation"

---

### Other Resources

**Purpose:** Catch-all category for tutorials, videos, e-books, webinars, and other educational content.

**Visual Identity:**
- Badge Color: **Purple**
- Badge Text: "Other"

**Key Features:**
- External URL to resource
- No tasks or duration
- Flexible content types
- Broad categorization

**When to Create:**
- Sharing video tutorials
- Linking to webinars or recordings
- Providing e-book downloads
- Sharing blog posts or articles
- Any educational content not fitting other categories

**User Experience:**
- Clicks resource card → Opens external URL in new tab
- May open videos, PDFs, blog posts, etc.
- Varied content consumption based on resource type

**Example Use Cases:**
- "Video: Introduction to Kubernetes"
- "E-book: Automation Best Practices"
- "Webinar Recording: Security Trends 2026"
- "Blog: Top 10 OpenShift Tips"

---

### Type Comparison

| Characteristic | Quick Start | Learning Path | Documentation | Other Resources |
|----------------|-------------|---------------|---------------|-----------------|
| **Badge Color** | Green | Cyan | Orange | Purple |
| **Interactive Tasks** | ✓ Yes | ✗ No | ✗ No | ✗ No |
| **Duration Field** | ✓ Required | ✗ No | ✗ No | ✗ No |
| **Introduction Panel** | ✓ Yes | ✗ No | ✗ No | ✗ No |
| **Prerequisites** | ✓ Optional | ✗ No | ✗ No | ✗ No |
| **External URL** | ✗ Optional | ✓ Required | ✓ Required | ✓ Required |
| **Opens in Console** | ✓ Side panel | ✗ External tab | ✗ External tab | ✗ External tab |
| **Task Validation** | ✓ Per task | ✗ N/A | ✗ N/A | ✗ N/A |
| **Wizard Steps** | 6 steps | 3 steps | 3 steps | 3 steps |
| **Complexity** | High | Low | Low | Low |
| **Content Location** | In YAML | External | External | External |

**Metadata Flags:**

```typescript
// Quick Start - No flags
metadata: {
  name: 'my-quickstart'
}

// Learning Path
metadata: {
  name: 'my-learning-path',
  learningPath: true
}

// Documentation
metadata: {
  name: 'my-documentation',
  externalDocumentation: true
}

// Other Resource
metadata: {
  name: 'my-other-resource',
  otherResource: true
}
```

---

## Creating Resources with the Wizard

### Creating a Quick Start

**Step 1: Select Resource Kind**

1. Navigate to https://console.stage.redhat.com/learning-resources/creator
2. Select "Quick start" from the kind dropdown
3. Click "Next"

**Step 2: Basic Details**

Fill in the following fields:

| Field | Required | Description | Example |
|-------|----------|-------------|---------|
| **Name** | ✓ Yes | Unique identifier (kebab-case) | `create-openshift-cluster` |
| **Display Name** | ✓ Yes | User-facing title | `Create your first OpenShift cluster` |
| **Description** | ✓ Yes | Brief summary (2-3 sentences) | `Learn how to create and configure a basic OpenShift cluster...` |
| **Tags** | ✗ Optional | Product families, use cases | `openshift`, `clusters`, `deploy` |
| **Duration** | ✓ Yes | Estimated time in minutes (1-90) | `15` |

**Step 3: Create Overview**

Define the introduction content:

| Field | Required | Description |
|-------|----------|-------------|
| **Introduction** | ✓ Yes | Markdown-formatted welcome text explaining what users will learn |
| **Prerequisites** | ✗ Optional | List of requirements (e.g., "Access to OpenShift console", "Basic Kubernetes knowledge") |

**Introduction Example:**
```markdown
## Welcome to the OpenShift Cluster Creation Quick Start

This quick start will guide you through creating your first OpenShift cluster. You'll learn:
- How to access the cluster creation wizard
- Key configuration options
- Best practices for cluster sizing
- How to verify your cluster is running

Let's get started!
```

**Step 4-?: Create Tasks (1-10 tasks)**

For each task, provide:

| Field | Required | Description |
|-------|----------|-------------|
| **Task Title** | ✓ Yes | Short task name | `Access the cluster wizard` |
| **Task Description** | ✓ Yes | Markdown-formatted instructions | Step-by-step guidance |
| **Review Instructions** | ✓ Yes | How to verify completion | `You should see the cluster in the list` |
| **Failed Task Help** | ✗ Optional | Troubleshooting tips | `If you don't see the cluster, check...` |

**Task Description Example:**
```markdown
### Access the Cluster Creation Wizard

1. Click on **Clusters** in the left navigation
2. Click the **Create cluster** button
3. Select **OpenShift Container Platform**
4. Click **Next**

You should now see the cluster configuration form.
```

**Step Final: Review and Download**

1. Review the live preview on the right
2. Click "Approve card and create quickstart panel"
3. Download the generated YAML file
4. Submit the YAML file according to your organization's process

---

### Creating a Learning Path

**Step 1: Select Resource Kind**

1. Select "Learning path" from the kind dropdown
2. Click "Next"

**Step 2: Basic Details**

Fill in the following fields:

| Field | Required | Description |
|-------|----------|-------------|
| **Name** | ✓ Yes | Unique identifier | `openshift-administrator-path` |
| **Display Name** | ✓ Yes | User-facing title | `OpenShift Administrator Learning Path` |
| **Description** | ✓ Yes | What users will learn | `Master OpenShift administration through this curated collection...` |
| **Tags** | ✗ Optional | Categorization | `openshift`, `automation`, `clusters` |
| **External URL** | ✓ Yes | Link to learning path | `https://www.redhat.com/en/services/training/...` |

**Step 3: Review and Download**

1. Check the live preview
2. Click "Approve card and generate files"
3. Download YAML file

---

### Creating Documentation

**Step 1: Select Resource Kind**

1. Select "Documentation" from the kind dropdown
2. Click "Next"

**Step 2: Basic Details**

Fill in the following fields:

| Field | Required | Description |
|-------|----------|-------------|
| **Name** | ✓ Yes | Unique identifier | `openshift-docs` |
| **Display Name** | ✓ Yes | Documentation title | `OpenShift Container Platform Documentation` |
| **Description** | ✓ Yes | What the docs cover | `Official documentation for OpenShift Container Platform...` |
| **Tags** | ✗ Optional | Categorization | `openshift`, `documentation` |
| **Documentation URL** | ✓ Yes | Link to docs | `https://docs.openshift.com` |

**Step 3: Review and Download**

1. Check the live preview (will show hostname)
2. Click "Approve card and generate files"
3. Download YAML file

---

### Creating Other Resources

**Step 1: Select Resource Kind**

1. Select "Other resource" from the kind dropdown
2. Click "Next"

**Step 2: Basic Details**

Fill in the following fields:

| Field | Required | Description |
|-------|----------|-------------|
| **Name** | ✓ Yes | Unique identifier | `intro-kubernetes-video` |
| **Display Name** | ✓ Yes | Resource title | `Video: Introduction to Kubernetes` |
| **Description** | ✓ Yes | What the resource covers | `Watch this 30-minute video to learn Kubernetes basics...` |
| **Tags** | ✗ Optional | Categorization | `kubernetes`, `containers`, `automation` |
| **Resource URL** | ✓ Yes | Link to content | `https://www.youtube.com/watch?v=...` |

**Step 3: Review and Download**

1. Check the live preview
2. Click "Approve card and generate files"
3. Download YAML file

---

## Creating Resources with YAML Editor

### YAML Structure

All learning resources follow the Kubernetes Custom Resource Definition (CRD) format:

```yaml
apiVersion: console.openshift.io/v1
kind: QuickStarts
metadata:
  name: <unique-identifier>
  tags: []
  # Type-specific flags (optional):
  # learningPath: true
  # externalDocumentation: true
  # otherResource: true
spec:
  version: 0.1
  displayName: <User-facing title>
  type:
    text: <Quick start|Learning path|Documentation|Other>
    color: <green|cyan|orange|purple>
  description: <Brief summary>
  # Additional fields based on type...
```

### Quick Start YAML Template

```yaml
apiVersion: console.openshift.io/v1
kind: QuickStarts
metadata:
  name: sample-quickstart
  tags:
    - kind: product-families
      value: openshift
    - kind: use-case
      value: clusters
spec:
  version: 0.1
  displayName: Sample Quick Start
  durationMinutes: 15
  type:
    text: Quick start
    color: green
  description: This quick start teaches you how to perform a specific task in the console.
  introduction: |
    ## Welcome to the Sample Quick Start

    This guide will walk you through:
    - Step 1 overview
    - Step 2 overview
    - Step 3 overview

    Let's get started!
  prerequisites:
    - Access to OpenShift console
    - Basic understanding of containers
  tasks:
    - title: First Task
      description: |
        ### Complete the first step

        1. Navigate to **Administration** > **Custom Resource Definitions**
        2. Click **Create CustomResourceDefinition**
        3. Fill in the required fields

        You should see the new CRD in the list.
      review:
        instructions: |
          #### Verify your work
          - Check that the CRD appears in the list
          - Verify the status shows "Ready"
        failedTaskHelp: |
          If you don't see the CRD:
          - Ensure you clicked "Create"
          - Check for validation errors
    - title: Second Task
      description: |
        ### Complete the second step

        Now that you've created the CRD, let's use it...
      review:
        instructions: Verify the instance was created successfully
        failedTaskHelp: Check the console for error messages
  conclusion: |
    Congratulations! You've completed this quick start.

    **Next steps:**
    - Explore related quick starts
    - Read the documentation
```

### Learning Path YAML Template

```yaml
apiVersion: console.openshift.io/v1
kind: QuickStarts
metadata:
  name: sample-learning-path
  learningPath: true
  tags:
    - kind: product-families
      value: openshift
    - kind: content
      value: learningPath
spec:
  version: 0.1
  displayName: Sample Learning Path
  type:
    text: Learning path
    color: cyan
  description: A curated collection of learning materials to master OpenShift administration.
  link:
    href: https://www.redhat.com/en/services/training/learning-path
    text: View learning path
```

### Documentation YAML Template

```yaml
apiVersion: console.openshift.io/v1
kind: QuickStarts
metadata:
  name: sample-documentation
  externalDocumentation: true
  tags:
    - kind: product-families
      value: openshift
    - kind: content
      value: documentation
spec:
  version: 0.1
  displayName: OpenShift Container Platform Documentation
  type:
    text: Documentation
    color: orange
  description: Official documentation for OpenShift Container Platform, covering installation, administration, and development.
  link:
    href: https://docs.openshift.com/container-platform/latest/
    text: Read documentation
```

### Other Resource YAML Template

```yaml
apiVersion: console.openshift.io/v1
kind: QuickStarts
metadata:
  name: sample-video-tutorial
  otherResource: true
  tags:
    - kind: product-families
      value: kubernetes
    - kind: use-case
      value: containers
spec:
  version: 0.1
  displayName: "Video: Introduction to Kubernetes"
  type:
    text: Other
    color: purple
  description: Watch this comprehensive 30-minute video tutorial introducing Kubernetes concepts, architecture, and basic operations.
  link:
    href: https://www.youtube.com/watch?v=example
    text: Watch video
```

---

## Common Fields Reference

### Metadata Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | ✓ Yes | Unique identifier (kebab-case, alphanumeric + hyphens) |
| `tags` | array | ✗ No | Categorization tags for filtering |
| `learningPath` | boolean | ✗ No | Set to `true` for learning paths |
| `externalDocumentation` | boolean | ✗ No | Set to `true` for documentation |
| `otherResource` | boolean | ✗ No | Set to `true` for other resources |

### Spec Fields

| Field | Type | Required For | Description |
|-------|------|--------------|-------------|
| `version` | number | All | Resource version (typically `0.1`) |
| `displayName` | string | All | User-facing title |
| `type.text` | string | All | Type label displayed on badge |
| `type.color` | string | All | Badge color (green, cyan, orange, purple) |
| `description` | string | All | Brief summary (2-3 sentences) |
| `durationMinutes` | number | Quick Starts | Estimated completion time (1-90) |
| `introduction` | string | Quick Starts | Markdown-formatted welcome text |
| `prerequisites` | array | Quick Starts | List of prerequisite requirements |
| `tasks` | array | Quick Starts | Array of task objects (1-10 tasks) |
| `conclusion` | string | Quick Starts | Optional closing message |
| `link.href` | string | LP/Doc/Other | External URL |
| `link.text` | string | LP/Doc/Other | Link button text |

### Tag Structure

Tags follow a `kind`/`value` structure for filtering:

```yaml
tags:
  - kind: product-families
    value: openshift
  - kind: product-families
    value: ansible
  - kind: use-case
    value: automation
  - kind: content
    value: quickstart
```

**Available Tag Kinds:**

- `product-families`: `openshift`, `ansible`, `rhel`, `iam`, `settings`, `subscriptions-services`
- `use-case`: `automation`, `clusters`, `containers`, `data-services`, `deploy`, `identity-and-access`, `images`, `infrastructure`, `observability`, `security`, `spend-management`, `system-configuration`
- `content`: `documentation`, `learningPath`, `quickstart`, `otherResource`

### Task Object Structure

```yaml
tasks:
  - title: Task title (short)
    description: |
      Markdown-formatted instructions
      Can include multiple paragraphs
      And formatting
    review:
      instructions: How to verify completion
      failedTaskHelp: Troubleshooting tips if task fails
```

---

## Live Preview

Both Wizard and YAML modes include a **live preview panel** on the right side showing exactly how the resource card will appear to users.

**Preview Features:**
- Real-time updates as you type
- Accurate badge colors and labels
- Tag display
- Description preview
- Link button (for external resources)
- Duration indicator (for quick starts)

**Preview Location:** `src/components/creator/CreatorPreview.tsx`

The preview uses the same `GlobalLearningResourcesQuickstartItem` component as the actual catalog, ensuring WYSIWYG accuracy.

---

## Downloading and Submitting

### Download Process

1. Complete the Wizard or finalize your YAML
2. Click the appropriate button:
   - Quick Starts: "Approve card and create quickstart panel"
   - Other types: "Approve card and generate files"
3. A YAML file will be downloaded to your computer

**File Naming:**
- Quick Starts: `<name>-quickstart.yaml`
- Learning Paths: `<name>-learning-path.yaml`
- Documentation: `<name>-documentation.yaml`
- Other: `<name>-other.yaml`

### Submission Process

All learning resources are stored in the **quickstarts repository**: https://github.com/RedHatInsights/quickstarts

After downloading the YAML file, follow these steps to submit your learning resource:

#### 1. Review and Prepare

- **Review the YAML** for accuracy and completeness
- **Test locally** if possible (see repository documentation)
- Ensure your resource follows the naming conventions

#### 2. Fork and Clone the Repository

```bash
# Fork the repository on GitHub, then clone your fork
git clone https://github.com/YOUR-USERNAME/quickstarts.git
cd quickstarts
```

#### 3. Create a New Branch

```bash
git checkout -b add-your-quickstart-name
```

#### 4. Add Your Resource

Each learning resource lives in its own folder under `docs/quickstarts/`:

```
docs/quickstarts/
├── your-quickstart-name/
│   ├── your-quickstart-name.yml    # Main quickstart YAML
│   └── metadata.yml                 # Metadata file
```

**Steps:**

1. Create a new folder with your quickstart name:
   ```bash
   mkdir -p docs/quickstarts/your-quickstart-name
   ```

2. Move your downloaded YAML file into this folder:
   ```bash
   mv ~/Downloads/your-quickstart-name.yaml docs/quickstarts/your-quickstart-name/your-quickstart-name.yml
   ```

3. Create a `metadata.yml` file in the same folder with basic metadata:
   ```yaml
   # docs/quickstarts/your-quickstart-name/metadata.yml
   kind: QuickStarts
   name: your-quickstart-name
   ```

#### 5. Commit and Push

```bash
git add docs/quickstarts/your-quickstart-name/
git commit -m "Add quickstart: Your QuickStart Display Name"
git push origin add-your-quickstart-name
```

#### 6. Open a Pull Request

1. Go to https://github.com/RedHatInsights/quickstarts
2. Click **"New Pull Request"**
3. Select your fork and branch
4. Fill in the PR description with:
   - **Title:** "Add quickstart: Your QuickStart Display Name"
   - **Description:** Brief explanation of what the quickstart teaches
   - **Type:** Quick Start / Learning Path / Documentation / Other
   - **Target audience:** Who should use this resource
5. Request review from **platform-experience-services-commiters**

#### 7. Address Review Feedback

- Respond to any comments or requested changes
- Update your branch as needed
- Once approved, the team will merge your PR

#### 8. Deployment

- **Deployment happens automatically** after merge
- Your resource will appear in the console within the next deployment cycle
- You can verify it at https://console.redhat.com/learning-resources

**Repository Structure Reference:**

```
quickstarts/
├── docs/
│   ├── help-topics/
│   └── quickstarts/
│       ├── ansible-create-first-playbook/
│       │   ├── ansible-create-first-playbook.yml
│       │   └── metadata.yml
│       ├── hac-sample-app/
│       │   ├── hac-sample-app.yml
│       │   └── metadata.yml
│       └── your-quickstart-name/
│           ├── your-quickstart-name.yml
│           └── metadata.yml
```

**Technical Implementation:** `src/components/creator/steps/download.tsx`

---

## Best Practices

### General Guidelines

1. **Clear, Concise Titles**
   - Use action verbs for quick starts: "Create", "Deploy", "Configure"
   - Keep under 60 characters
   - Make it immediately clear what users will learn

2. **Descriptive Summaries**
   - 2-3 sentences maximum
   - Explain what, why, and who it's for
   - Include key outcomes or benefits

3. **Accurate Tagging**
   - Tag all relevant product families
   - Include appropriate use cases
   - Use consistent tag values (check existing resources)

4. **Realistic Duration**
   - Test the quick start yourself
   - Add 25% buffer time for first-time users
   - Round to nearest 5 minutes

### Quick Start Best Practices

1. **Task Structure**
   - 3-7 tasks is ideal (not too short, not overwhelming)
   - Each task should be completable in 2-5 minutes
   - Start simple, gradually increase complexity
   - End with a verification or success indicator

2. **Clear Instructions**
   - Use numbered steps for sequential actions
   - Include exact UI element names in **bold**
   - Provide screenshots or descriptions of what to look for
   - Use markdown formatting for readability

3. **Prerequisites**
   - List all required access/permissions
   - Include necessary background knowledge
   - Mention any required resources (clusters, accounts, etc.)
   - Keep the list short (3-5 items maximum)

4. **Introduction**
   - Hook users with the value proposition
   - List what they'll learn
   - Set expectations for time and difficulty
   - Keep it under 200 words

5. **Review Instructions**
   - Be specific about what success looks like
   - Include visual cues when possible
   - Provide clear pass/fail criteria
   - Keep it concise (1-2 sentences)

6. **Failed Task Help**
   - Cover the most common failure points
   - Suggest concrete troubleshooting steps
   - Link to documentation for complex issues
   - Be encouraging and supportive

### External Resource Best Practices

1. **URL Validation**
   - Ensure URLs are permanent (avoid shortened links)
   - Use HTTPS when available
   - Verify links work before submitting
   - Use official Red Hat domains when possible

2. **Description Accuracy**
   - Mention the content type (video, PDF, article, etc.)
   - Include approximate length or size
   - Note if registration is required
   - Mention key takeaways

3. **Resource Type Selection**
   - Use **Documentation** for official product docs
   - Use **Learning Path** for curated multi-resource collections
   - Use **Other** for videos, blogs, webinars, e-books

### Markdown Tips

Quick starts support full markdown formatting:

```markdown
# Heading 1
## Heading 2
### Heading 3

**Bold text**
*Italic text*

- Bullet point
- Bullet point

1. Numbered list
2. Numbered list

[Link text](https://example.com)

`inline code`

> Blockquote for important notes
```

**Recommended Formatting:**
- Use `###` (H3) for task section headings
- Use `##` (H2) for introduction sections
- Use **bold** for UI element names
- Use `inline code` for commands or values to enter
- Use > blockquotes for warnings or important notes

---

## Troubleshooting

### Common Issues

**Issue:** Wizard validation fails but field looks correct

**Solution:** Check for:
- Leading/trailing spaces
- Special characters in name field (use kebab-case only)
- Duplicate names (must be globally unique)
- Missing required fields

---

**Issue:** YAML download not working

**Solution:**
- Check browser popup blocker settings
- Try switching to YAML view first
- Refresh the page and try again

---

**Issue:** Preview not updating

**Solution:**
- Click outside the field to trigger update
- Switch tabs and switch back
- Check browser console for errors

---

**Issue:** Can't access Creator

**Solution:**
- Verify you have the `platform.chrome.quickstarts.creator` feature flag enabled
- Check your user permissions
- Try logging out and back in

---

## Additional Resources

**Repository:** https://github.com/RedHatInsights/learning-resources

**Related Documentation:**
- [Technical Reference](./TECHNICAL_REFERENCE.md) - Full technical documentation
- [PatternFly Quick Starts](https://www.patternfly.org/v4/extensions/quick-starts) - Quick start design patterns
- [Markdown Guide](https://www.markdownguide.org/) - Markdown syntax reference

**Support:**
- File issues: https://github.com/RedHatInsights/learning-resources/issues
- Contact the HCC Framework team for questions (#team-consoledot-experience-services)

---

**Document Version:** 1.0
**Last Updated:** February 2026
**Maintainer:** HCC Framework Team
