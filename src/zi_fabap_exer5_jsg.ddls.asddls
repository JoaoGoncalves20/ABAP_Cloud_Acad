@EndUserText.label: 'CDS table function'
define table function ZI_FABAP_EXER5_JSG
returns {
  
  key client     : abap.clnt;
  key travel_id  : /dmo/travel_id;
  key booking_id : /dmo/booking_id;
  booking_date  : /dmo/booking_date;
  customer_id   : /dmo/customer_id;
  carrier_id    : /dmo/carrier_id;
  connection_id : /dmo/connection_id;
  flight_date   : /dmo/flight_date;  
  flight_price  : /dmo/flight_price;
  currency_code : /dmo/currency_code;
}
implemented by method zcl_fabap_exer05_jsg=>get_data;