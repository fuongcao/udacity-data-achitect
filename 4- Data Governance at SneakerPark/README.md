## Project Overview

SneakerPark is an online shoe reseller that allows people to buy and sell used and new shoes. Buyers can bid for shoes or buy them outright, and sellers can set a price or sell to the highest bidder.
Each buyer and seller must have an active account in order to sell, bid, or purchase sneakers using SneakerPark’s website.

SneakerPark authenticates the shoes before shipping them to the buyer, so before listing an item, the seller must ship it to SneakerPark’s warehouse. Upon receipt, SneakerPark assigns an item number to each pair of sneakers and notifies the seller that they are now free to list their item. If the item is not listed within 45 days, SneakerPark returns the sneakers to the seller and sends an invoice to the seller for the shipping cost.
If the item is found to be inauthentic or in an unacceptable condition, it is also returned back to the seller in a similar fashion.

When the item sells, the seller's account is credited with the purchase price minus the SneakerPark service fee and shipping fees to deliver the item to the buyer.

![project-visual](images/project-visual.png)

### Motivation

SneakerPark’s business has grown rapidly over the past year and it has led to some growing pains. As the number of sellers, buyers, items, and sales increased, the company started running into discrepancies between systems which resulted in mischarges, lost revenue, and frustrated customers. With this in mind, Sneaker Park has decided to invest in an Enterprise Data Management program to gain better visibility and control over their data systems.

**Phase 1**

Creating the foundational data management tools and artifacts that will allow SneakerPark to better manage its data now and in the future. More specifically, this entails documenting SneakerPark's data systems, setting up a data catalog, designing better data quality and master data management processes, and formalizing data governance roles.

**Phase 2**

Building out an Enterprise Data Warehouse solution to replace the existing legacy data warehouse, MS Access databases, and excel reports. Phase 2 is a separate initiative and therefore is not a part of this project.

#### Project Steps Overview

1. Create Enterprise Conceptual Model
2. Design the draft version of the Enterprise Data Catalog by documenting the metadata in an Excel spreadsheet.
3. Profile the data to identify 3 data quality issues. Create a document that lists each data quality issue, its description, and a suggested remediation strategy for each.
4. Design a data quality dashboard that will report on the issues you’ve identified above plus at least 1 more issue that you foresee might occur in the future.
5. Sketch out a proposed MDM implementation architecture, and write a detailed explanation of the reason for the chosing this specific approach base on SneakerPark’s systems and business model.
6. Define a set of matching rules that will be used by SneakerPark's MDM Hub to match item and customer entities between the company's different systems.
7. Write a paragraph discussing what data governance roles and responsibilities will be necessary to oversee this new Data Management initiative.

### The systems that SneakerPark relies on for its day-to-day operations are:

1. **User Service** - allow buyer and seller to register an account with sneakerpark.com.
2. **Inventory Management Service** - keep track of the current invetory od sneakers in the wareshouse.
3. **Listing Service** - allow seller to create listing once their items have been approved.
4. **Order Processing Service** - processes orders and stores order details.
5. **Customer Services Appliaction** - record customer support request information from customer service calls and emails.
