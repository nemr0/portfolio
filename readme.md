# Portfolio Project

![Logo](./assets/webp/logo.webp)

This repository contains the source code for my personal portfolio, built using modern web development technologies. The project is divided into multiple components to streamline functionality and scalability.

## Table of Contents

- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Setup and Installation](#setup-and-installation)
- [Deployment](#deployment)
- [License](#license)

## Overview

The portfolio is structured to serve general users. It also includes shared resources to maintain consistency and reduce duplication.

1. **Portfolio User**:
   - The user-facing website showcasing my projects, skills, and professional profile.
   - Deployed at [nemr.dev](https://nemr.dev).

2. **PocketBase Instance**: (private)

   - [x] Hosted on Railway, used for backend logic and storage operations. 
   - [x] Manages data for the portfolio(e.g., projects). 
   - [x] js hooks for email contact form.
   - [x] Linked to Cloudflare R2 for file storage. 

## Technologies Used

- **Flutter**: Primary framework for building the portfolio application.
- **PocketBase**: Backend storage and serverless logic, hosted on Railway.
- **CI/CD Scripts**: Automated scripts for deployment using:
   - **Cloudflare Pages**

## Project Structure

```plaintext
portfolio/
├── assets/
│   ├── fonts/ 
│   ├── svg/ 
│   └── webp/ 
├── lib/
│   ├── core/                   # Core utilities and constants
│   ├── data/                   # Data models and repositories
│   ├── domain/                 # Domain logic and use cases
│   ├── presentation/           # UI and state management
│   |   ├── screens/            # Screen widgets
│   |   ├── shared_widgets/     # Shared UI components
│   └── └── state_manager/      # State management (Cubits)
└── build.sh                    # CI/CD script for automated deployment
