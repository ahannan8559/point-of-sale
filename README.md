# Point of Sale (POS) - Inventory & Super Shop Management System - C#

<div align="center">
  
  ![C#](https://img.shields.io/badge/c%23-%23239120.svg?style=for-the-badge&logo=c-sharp&logoColor=white)
  &nbsp;![.Net 4.8](https://img.shields.io/badge/4.8-5C2D91?style=for-the-badge&logo=.net&logoColor=white)
  &nbsp;![MicrosoftSQLServer](https://img.shields.io/badge/Microsoft%20SQL%20Sever%202019-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)
  &nbsp;![Visual Studio](https://img.shields.io/badge/Visual%20Studio%202019-5C2D91.svg?style=for-the-badge&logo=visual-studio&logoColor=white)

</div>

# Quick Shortcuts

[**1. Get Started**](#point-of-sale-pos)
-
  - [Roles](#roles)
  - [Features](#features)


 [**2. Quick Overview - Setup & Run**](#quick-overview---setup--run)
-
- [Step - 1](#step---1)
- [Step - 2](#step---2)
- [Step - 3](#step---3)
- [Step - 4](#step---4)

  
 [**3. Tools & Technologies**](#tools-technologies)
 -

   - [Languages](#languages)
   - [IDE](#ide)
   - [Database](#database)
   - [Icons](#icons)
  
 [**4. Solution Explorer & Layer Architecture**](#solution-explorer--layer-architecture)
 -
 - [Solution Explorer](#solution-explorer--layer-architecture)
   - [Layer Architecture](#solution)
      - [**1. Application Layer**](#1-application-layer)
      - [**2. DataAccess Layer**](#2-dataaccess-layer)
      - [**3. Entity Layer**](#3-entity-layer)
      - [**4. Framework Layer**](#4-framework-layer)
      - [**5. Repository Layer**](#5-repository-layer)
  
  [**5. Database Diagram**](#database-diagram)
  -
  - [Diagram Image](#database-diagram)

  [**6. Screens**](#screens)
  -
  - [Windows Forms](#windows-forms)
    - [**# Login**](#-login)
    - [**# Dashboard**](#-dashboard)
    - [**# Make Payment**](#-make-payment)
    - [**# Sales History**](#-sales-history)
    - [**# Master Categories**](#-master-categories)
    - [**# Main Category**](#-main-category)
    - [**# Second Category**](#-second-category)
    - [**# Third Category**](#-third-category)
    - [**# Vendors**](#-vendors)
    - [**# Brands**](#-brands)
    - [**# Products**](#-products)
    - [**# Expenses Tracker**](#-expenses-tracker)
    - [**# Employees & User Tracker**](#-employees--user-tracker)
    - [**# Database Backup & Restore**](#-database-backup--restore)
  
 [**7. Note**](#note)
-

# Point of Sale (POS)

Point of Sale (POS) with N-Tier Architecture ([**5 Layers**](#solution)). This Project was developed in C# and follows Object Relational Mapping (ORM) from scratch and using MS SQL Server 2019 and .NET Framework 4.8 as backend. Project-based on my university course curriculum [CSC 2210: Object Oriented Programming 2](https://www.aiub.edu/faculties/fst/ug-course-catalog).
<br>


#### This POS has **3 Roles** features. 

## # Roles

- User 1 : **Admin**
- User 2 : **Cashier**  
- User 3 : **Salesman**

## # Features

> ### **1. Admin**
- Manage Employees – Add Employee, Delete Employee, Edit Employee Info.
- Manage Products – Add Product, Delete Product, Edit Product Info.
- Manage Stock – Add, Delete, Edit - Vendor’s Product.
- Salary History Tracking.
- Expenses & Liabilities Tracking.
- Make Sell.
- Bill Generate.
- Selling History.
- Database Backup & Restore.
  
<br>

> ### **2. Cashier**
- Make Sell.
- Bill Generate.
- Selling History.
- Manage Stock.

<br>

> ### **3. Salesman**
- Make Sell.
- Bill Generate.

<hr>

## Quick Overview - Setup & Run

>**Need to Download**:<br>[Visual Studio 2019](https://visualstudio.microsoft.com/downloads/)
<br>[.NET Framework 4.8](https://dotnet.microsoft.com/download/dotnet-framework/net48)
<br>[Microsoft SQL Server 2019 *Express (64-bit)*](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
<br>[SQL Server Management Studio (SSMS) 18.9.2](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15) 

#### Step - 1 
Download or Clone
```sh
git clone https://github.com/ahannan8559/point-of-sale
```

#### Step - 2
Make [Database](#database) follow this [Diagram](#database-diagram)

#### Step - 3
Make Database connection on [**DataAccess Layer**](#2-dataaccess-layer)

#### Step - 4
Goto project folder **PointOfSaleProject** open 
```POS.InventoryManagementSystem.sln``` with  ```Visual Studio```

#### Step - 3
Build & Run the project

<hr>


