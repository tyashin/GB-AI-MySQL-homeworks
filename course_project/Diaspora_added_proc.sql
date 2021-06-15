-- Хранимая процедура для выгрузки отчета об оскорбительном контенте в текстовый файл
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `diaspora`.`get_reports`()
BEGIN 
    DROP TEMPORARY TABLE IF EXISTS tmp_reports;
    CREATE TEMPORARY TABLE tmp_reports 
    SELECT id, item_id, item_type, text 
      FROM reports
     WHERE reports.reviewed = 0
     ORDER BY id;
  
    SELECT * 
      INTO OUTFILE '/var/lib/mysql-files/reports.txt'
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        LINES TERMINATED BY '\n'
      FROM tmp_reports;

    SELECT * FROM tmp_reports; 
END//
DELIMITER ;