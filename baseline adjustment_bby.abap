DATA: 
      lv_baseline_date TYPE sy-datum,      " Input baseline date      
      lv_day_of_week   TYPE i,             " Day of week (1=Mon to 7=Sun)      
      lv_adjustment    TYPE i,             " Days to adjust      
      lv_target_date   TYPE sy-datum.      " Resulting target date

* Example: Set baseline date (replace with your date)
lv_baseline_date = sy-datum. " Or your specific date

* Get the day of the week (1=Monday, 7=Sunday)
CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
            date = lv_baseline_date  
      IMPORTING    
            day  = lv_day_of_week

* Calculate adjustment based on the day
IF lv_day_of_week <= 2. " Monday (1) or Tuesday (2)  
      lv_adjustment = 2 - lv_day_of_week. " Move to current week's Tuesday
ELSE.                   " Wednesday (3) to Sunday (7)  
      lv_adjustment = 9 - lv_day_of_week. " Move to next week's Tuesday
ENDIF.

* Compute the target 
datelv_target_date = lv_baseline_date + lv_adjustment.


***Example***

Best Buy Marketplace:
            Baseline	Paid Date	Payment Term
Wednesday	12-Feb	21-Mar	37
Thursday	13-Feb	21-Mar	36
Friday	14-Feb	21-Mar	35
Saturday	15-Feb	21-Mar	34
Sunday	16-Feb	21-Mar	33
Monday	17-Feb	21-Mar	32
Tuesday	18-Feb	21-Mar	31
Wednesday	19-Feb	28-Mar	37
Thursday	20-Feb	28-Mar	36
Friday	21-Feb	28-Mar	35
Saturday	22-Feb	28-Mar	34
Sunday	23-Feb	28-Mar	33
Monday	24-Feb	28-Mar	32
Tuesday	25-Feb	28-Mar	31
