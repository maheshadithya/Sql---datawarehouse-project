USE DW1;
GO

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
BEGIN
    DROP TABLE bronze.crm_cust_info;
END
GO

CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE
);
GO
SELECT * FROM bronze.crm_cust_info

BULK INSERT bronze.crm_cust_info
from "C:\Users\mahes\OneDrive\Desktop\White Scholars\SQL\datasets\source_crm\cust_info.csv"
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
BEGIN
    DROP TABLE bronze.crm_prd_info;
END
GO
CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);
BULK INSERT bronze.crm_prd_info
from "C:\Users\mahes\OneDrive\Desktop\White Scholars\SQL\datasets\source_crm\prd_info.csv"
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);
use dw1;

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);

BULK INSERT bronze.crm_sales_details
from "C:\Users\mahes\OneDrive\Desktop\White Scholars\SQL\datasets\source_crm\sales_details.csv"
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);
select * from bronze.crm_sales_details
select * from bronze.crm_prd_info

CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);


CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);



CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);
BULK INSERT bronze.erp_loc_a101 
from "C:\Users\mahes\OneDrive\Desktop\White Scholars\SQL\datasets\source_erp\LOC_A101.csv"
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);

BULK INSERT bronze.erp_px_cat_g1v2 
from "C:\Users\mahes\OneDrive\Desktop\White Scholars\SQL\datasets\source_erp\PX_CAT_G1V2.csv" 
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);

BULK INSERT bronze.erp_cust_az12
from "C:\Users\mahes\OneDrive\Desktop\White Scholars\SQL\datasets\source_erp\CUST_AZ12.csv"
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);
