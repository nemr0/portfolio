# Portfolio Project

This repository contains the source code for my personal portfolio, built using modern web development technologies. The project is divided into multiple components to streamline functionality and scalability.

## Table of Contents

- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Setup and Installation](#setup-and-installation)
- [Deployment](#deployment)
- [License](#license)

## Overview

The portfolio is structured to serve two primary audiences: general users and administrators. It also includes shared resources to maintain consistency and reduce duplication.

1. **Portfolio User (`portfolio_user`)**:
    - The user-facing website showcasing my projects, skills, and professional profile.
    - Deployed at [nemr.dev](https://nemr.dev).

2. **Portfolio Admin (`portfolio_admin`)**:
    - An admin panel for managing the content displayed on the user-facing site.

3. **Project Shared (`project_shared`)**:
    - Shared resources (e.g., assets, models, utilities) used by both `portfolio_user` and `portfolio_admin`.

4. **Cloudflare Workers**:
    - Used for backend logic and storage operations through R2 Workers.
    - Note: The worker code is not included in this repository for privacy and security reasons.

## Technologies Used

- **Flutter**: Primary framework for building the `portfolio_user` and `portfolio_admin` applications.
- **Cloudflare Workers with R2**: Backend storage and serverless logic.
- **CI/CD Scripts**: Automated scripts for deployment using:
    - **Cloudflare Pages**
    - **Vercel**
    - Other hosting platforms as needed.

## Project Structure

```plaintext
portfolio/
├── portfolio_user/     # User-facing portfolio
├── portfolio_admin/    # Admin panel for portfolio management
├── project_shared/     # Shared resources and utilities
└── ./**.sh            # CI/CD scripts for automated deployment
```

## Setup and Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/nemr0/portfolio.git
   ```

2. **Navigate to the Project Directory**:

   ```bash
   cd portfolio
   ```

3. **Install Flutter**: (3.27.1)

   Ensure Flutter is installed on your system. Follow the instructions at the [official Flutter website](https://flutter.dev/docs/get-started/install).

4. **Install Dependencies**:

   Navigate to each subproject (`portfolio_user`, `portfolio_admin`, and `project_shared`) and install dependencies:

   ```bash
   flutter pub get
   ```

5. **Run the Projects**:

    - To run the user portfolio:

      ```bash
      flutter run -d chrome --project portfolio_user
      ```

    - To run the admin panel:

      ```bash
      flutter run -d chrome --project portfolio_admin
      ```

## Deployment

The repository includes scripts for automating deployment to popular hosting platforms such as Cloudflare Pages and Vercel. 

- Modify and use the generic `build_user_portfolio.sh` script for `portfolio_user`. 
- Modify and use the generic `build_user_portfolio.sh` script for `portfolio_admin`. 

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

For any inquiries or feedback, please contact me through my [GitHub profile](https://github.com/nemr0).
