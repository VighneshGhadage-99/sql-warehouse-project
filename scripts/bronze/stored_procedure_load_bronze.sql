

EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
  DECLARE @starttime DATETIME, @endtime DATETIME
  SET @starttime=GETDATE()
  BEGIN TRY
    DECLARE @startdate DATETIME ,@enddate DATETIME
	PRINT'========================================='
	PRINT'LOADING BRONZE LAYER'
	PRINT'========================================='

	PRINT'LOADING CRM TABLE'
	PRINT'-----------------------------------------'
	PRINT'bronze.crm_cust_info'
	
	SET @startdate=GETDATE()

	TRUNCATE TABLE bronze.crm_cust_info
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\vighn\OneDrive\Desktop\data_warehouse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH 
	(
	   FIRSTROW=2,
	   FIELDTERMINATOR =',',
	   TABLOCK
	   );
    SET @enddate= GETDATE()
	PRINT'>> LOAD DURATION: '+ CAST(DATEDIFF(second,@startdate,@enddate)AS NVARCHAR) +'seconds'

	PRINT'------------------------------------'
	PRINT'>>bronze.crm_prd_info'
	PRINT'------------------------------------'
	SET @startdate=GETDATE()
	TRUNCATE TABLE bronze.crm_prd_info
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\vighn\OneDrive\Desktop\data_warehouse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH 
	(
	   FIRSTROW=2,
	   FIELDTERMINATOR =',',
	   TABLOCK
	   );
    SET @enddate= GETDATE()
	PRINT'>> LOAD DURATION: '+ CAST(DATEDIFF(second,@startdate,@enddate)AS NVARCHAR) +'seconds'
    
	
	PRINT'-----------------------'
	PRINT'crm_sales_details'
	PRINT'-----------------------'
	
	SET @startdate=GETDATE()
	TRUNCATE TABLE bronze.crm_sales_details
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\vighn\OneDrive\Desktop\data_warehouse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH 
	(
	   FIRSTROW=2,
	   FIELDTERMINATOR =',',
	   TABLOCK
	   );
    SET @enddate= GETDATE()
	PRINT'>> LOAD DURATION: '+ CAST(DATEDIFF(second,@startdate,@enddate)AS NVARCHAR) +'seconds'
    
      
	PRINT'========================================='
	PRINT'LOADING ERP TABLE'
	PRINT'========================================='

	PRINT'bronze.erp_just_az12'
	PRINT'-------------------'
	
	SET @startdate=GETDATE()
	TRUNCATE TABLE bronze.erp_just_az12
	BULK INSERT bronze.erp_just_az12
	FROM 'C:\Users\vighn\OneDrive\Desktop\data_warehouse\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH 
	(
	   FIRSTROW=2,
	   FIELDTERMINATOR =',',
	   TABLOCK
	   );
    SET @enddate= GETDATE()
	PRINT'>> LOAD DURATION: '+ CAST(DATEDIFF(second,@startdate,@enddate)AS NVARCHAR) +'seconds'
    
	PRINT'--------------------'
	PRINT'bronze.erp_loc_a101'
	PRINT'--------------------'
	
	SET @startdate=GETDATE()
	TRUNCATE TABLE bronze.erp_loc_a101
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\vighn\OneDrive\Desktop\data_warehouse\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH 
	(
	   FIRSTROW=2,
	   FIELDTERMINATOR =',',
	   TABLOCK
	   );
       
    SET @enddate= GETDATE()
	PRINT'>> LOAD DURATION: '+ CAST(DATEDIFF(second,@startdate,@enddate)AS NVARCHAR) +'seconds'
	PRINT'--------------------'
	
	PRINT'erp_px_cat_g1v2'
	PRINT'--------------------'
	
	SET @startdate=GETDATE()
	TRUNCATE TABLE bronze.erp_px_cat_g1v2
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\vighn\OneDrive\Desktop\data_warehouse\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH 
	(
	   FIRSTROW=2,
	   FIELDTERMINATOR =',',
	   TABLOCK
	   );
        
    SET @enddate= GETDATE()
	PRINT'>> LOAD DURATION: '+ CAST(DATEDIFF(second,@startdate,@enddate)AS NVARCHAR) +'seconds'
  
  
  END TRY
  
 
  BEGIN CATCH
    PRINT'ERROR OCCURS DURING LOADING OF BRONZE LAYER'
  END CATCH
  SET @endtime=GETDATE()
  PRINT'LOAD DURATION FOR WHOLE PROCESS = '+ CAST(DATEDIFF(second,@starttime,@endtime) AS NVARCHAR) + 'seconds'
END
