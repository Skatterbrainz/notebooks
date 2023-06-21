# PowerShell: Importing Data

## Overview

* There are many ways to bring data into PowerShell for processing
  * Files (Text, CSV, JSON, XML, INI)
  * Databases (SQL, Kusto, CIM/WMI)
  * REST APIs
* Human (direct) input
  * Best for small amounts of data input
* Batch input
  * Best for larger amounts of data input or repetitive input
  * Ideal for logging and auditing
* Examples:
  * Querying information from 2 or 3 machines
  * Querying information from 10,000 machines

Situations which involve processing large numbers of input values are often challenging to enter manually. Even when populating a list of values manually, it can be a challenge. PowerShell can help with retrieving a list of values from nearly unlimited types of sources. Common examples are listed below.

* Direct entry (array, arraylist, generic list, etc.)
* File import (txt, csv, xlsx, xml, json, etc.)
* Database query results (SQL)
* Active Directory query (LDAP, ADSI)
* Web content (REST, HTML, etc.)

Each of these examples (above) could potentially provide a list of values to be fed into other processes. For example, a list of user accounts, devices, employee records and so on. The list could consist of simple value types like strings or numbers, or could be objects. What you decide to extract from a data source will depend on what you need to do with the data afterwards. If you only need device names, then you can speed up the import process by only requesting the device names.

## Examples

* [Reading CSV files](./import-csv.ipynb)
* [Reading INI files](./import-ini.ipynb)
* [Reading XML files](./import-xml.ipynb)
* [Reading JSON files](./import-json.ipynb)
* [Reading TEXT files](./import-text.ipynb)
* [Reading Directory Services](./import-dirsvc.ipynb)
* [Reading SQL Databases](./import-sql.ipynb)
* [Reading REST API data](./import-rest.ipynb)
* [Reading API data](./import-api.ipynb)