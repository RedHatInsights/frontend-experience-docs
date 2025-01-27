# Frontend Experience Documentation

This repository serves as a centralized hub for the **Platform Experience UI team's** best practices, guidelines, and general knowledge sharing. The goal is to maintain consistency across projects, improve collaboration, and facilitate onboarding for new team members.

---

### The information contributed there is published in the inScope docs
- [prod](https://inscope.corp.redhat.com/docs/default/component/frontend-experience-docs/)
- [stage](https://inscope.corp.stage.redhat.com/docs/default/component/frontend-experience-docs/)

---

### What should be included:
- **Best practices** for frontend development
- **Knowledge-sharing videos** and outputs from similar discussions or meetings
- **General useful information** contributed by team members

### What shouldn't be included:
- **Service-specific content**

  *Each application's/service's documentation should be maintained separately within its repository. This ensures a clean separation between high-level guidelines and individual application details.*

---

## How to contribute

If you'd like to add new content to the documentation (GitHub repository [link](https://github.com/RedHatInsights/frontend-experience-docs)):
1. **Create a new Markdown file (`*.md`)** inside the `/pages` folder.
2. **Update the `mkdocs.yml` file** to include a reference to your new file, ensuring it gets added to the documentation structure.
3. **Open a pull request with your changes**.
4. After the pull request is merged, your changes should be automatically published to both stage and prod.

---

## Linked markdown files

Currently, this repository also contains markdown files that are periodically pulled from the repositories of the services maintained by the Platform Experience UI team. These files have the navigation entries defined under the "Services" section in the `mkdocs.yml` file. The [update_services.yml](https://github.com/RedHatInsights/frontend-experience-docs/blob/master/.github/workflows/update_services.yml) workflow with the related [script](https://github.com/RedHatInsights/frontend-experience-docs/blob/master/update_services.sh) takes care of updating the files every week on Tuesday. 

If you need to add a new external file to the repository, please:
1. Add a new record for the service to the `mkdocs.yml` file.
2. Enhance the list of repositories in the `update_services.sh` script.

---

## Contact and support

If you encounter any unclear, outdated information or have questions, please **reach out to the Platform Experience UI team** on Slack (`@platform-experience-ui` in `#forum-consoledot-ui`).

---

*Thank you in advance for your contributions and help to improve this documentation!*
