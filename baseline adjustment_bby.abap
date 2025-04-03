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