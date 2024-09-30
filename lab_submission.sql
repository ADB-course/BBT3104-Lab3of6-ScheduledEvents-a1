-- CREATE EVN_average_customer_waiting_time_every_1_hour
CREATE EVENT EVN_average_customer_waiting_time_every_1_hour
ON SCHEDULE EVERY 1 HOUR
DO
  INSERT INTO customer_service_kpi (average_waiting_time, record_time)
  SELECT AVG(customer_service_total_wait_time_minutes), NOW()
  FROM customer_service_ticket
  WHERE customer_service_ticket_raise_time >= NOW() - INTERVAL 1 HOUR;
