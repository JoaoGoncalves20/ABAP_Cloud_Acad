CLASS zcl_fabap_jul2025_exer13_jsg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer13_jsg IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " ----------------------------------------------------------------------
    " Tópico: Inline Declarations
    " Descrição: Declaração de variáveis antes do ABAP 7.40.
    " ----------------------------------------------------------------------
    DATA(lv_carrid) = 'AA'.
    out->write( |Old Version - Carrier ID: { lv_carrid }| ).

    TYPES: BEGIN OF ty_flight_old,
             carrid      TYPE /dmo/carrier_id,
             connid      TYPE /dmo/connection_id,
             flight_date TYPE /dmo/flight_date,
           END OF ty_flight_old,
           tt_flight_old TYPE SORTED TABLE OF ty_flight_old WITH NON-UNIQUE KEY carrid connid.

    DATA(lt_flights_old) = VALUE tt_flight_old( (
    carrid      = 'LH'
    connid      = '0400'
    flight_date = '20250725' ) ) .

    DATA(lv_version) = REDUCE string(
                        INIT lv_string = ''
                        FOR ls_flights
                        IN lt_flights_old
                        NEXT lv_string &&= |Old Version - Flights found (SELECT):  { lv_string } { ls_flights-carrid }-{ ls_flights-connid }| ).

    SELECT FROM /dmo/flight
      FIELDS *
      INTO TABLE @DATA(lt_flights_select_old)
      UP TO 2 ROWS.

    out->write( |New Version - Flights found (SELECT): { lines( lt_flights_select_old ) }| ).

    " ----------------------------------------------------------------------
    " Tópico: Table Expressions
    " Descrição: Acesso a linhas de tabelas internas antes do ABAP 7.40.
    " ----------------------------------------------------------------------
    DATA ls_flight_expr_old TYPE ty_flight_old.
    DATA lv_first           TYPE string.
    DATA lv_flight          TYPE string.

*    READ TABLE lt_flights_old INTO ls_flight_expr_old INDEX 1.
*
*    CONCATENATE 'Old Version - First Flight:'
*              ls_flight_expr_old-carrid
*              ls_flight_expr_old-connid
*              ls_flight_expr_old-flight_date
*                INTO lv_first SEPARATED BY ' '.

    CHECK line_exists( lt_flights_old[ 1 ] ).

    lv_version = 'Old Version - First Flight:' && |{ lt_flights_old[ 1 ]-carrid } { lt_flights_old[ 1 ]-connid } { lt_flights_old[ 1 ]-flight_date }|.

    CHECK line_exists( lt_flights_old[ carrid = 'LH' connid = '0400' ] ).

    lv_version = 'Old Version - First Flight:' && |{ lt_flights_old[ carrid = 'LH' connid = '0400' ]-carrid } { lt_flights_old[ carrid = 'LH' connid = '0400' ]-connid } { lt_flights_old[ carrid = 'LH' connid = '0400' ]-flight_date }|.

    out->write( lv_version ).

    " ----------------------------------------------------------------------
    " Tópico: Conversion Operator CONV
    " Descrição: Conversão de tipos de dados antes do ABAP 7.40.
    " ----------------------------------------------------------------------
    DATA lv_int   TYPE i.
    DATA lv_char   TYPE c LENGTH 10 VALUE '12345'.

    lv_int = CONV #( lv_char ).
    lv_char = CONV #( lv_int ).

    out->write( |Old Version - Converted to INT: { lv_char } | ).

*    " ----------------------------------------------------------------------
*    " Tópico: Value Operator VALUE
*    " Descrição: Inicialização de estruturas e tabelas internas antes do ABAP 7.40.
*    " ----------------------------------------------------------------------

    DATA(ls_connection) = VALUE /dmo/connection( airport_from_id = 'FRA' airport_to_id = 'JFK' ).

    out->write( |Old Version - Connection: { ls_connection-airport_from_id }-{ ls_connection-airport_to_id }| ).


*    DATA lt_flights_value_old TYPE STANDARD TABLE OF ty_flight_old.
*
*    APPEND INITIAL LINE TO lt_flights_value_old ASSIGNING FIELD-SYMBOL(<fs_flight_value>).
*
*    <fs_flight_value>-carrid      = 'UA'.
*    <fs_flight_value>-connid      = '0001'.
*    <fs_flight_value>-flight_date = '20250725'.

    CLEAR lt_flights_old.

    lt_flights_old = VALUE #( ( carrid = 'UA' connid = '0001' flight_date = '20250725' )
                              ( carrid = 'DL' connid = '0001' flight_date = '20250725' ) ).

    out->write( |Old Version - Flights count (VALUE): { lines( lt_flights_old ) }| ).

*    " ----------------------------------------------------------------------
*    " Tópico: LOOP X FOR operator
*    " Descrição: Criação de tabelas internas com loops explícitos antes do ABAP 7.50.
*    " ----------------------------------------------------------------------
    DATA lt_flights_for_old TYPE SORTED TABLE OF ty_flight_old WITH NON-UNIQUE KEY carrid connid.
*
    SELECT
      FROM /dmo/flight
      FIELDS carrier_id, connection_id, flight_date
      INTO TABLE @lt_flights_for_old.

    out->write( |New Version - Flights for UA: {  CONV string( lines( FILTER #( lt_flights_for_old WHERE carrid = CONV #( 'UA' ) ) ) ) } | ) .

*    " ----------------------------------------------------------------------
*    " Tópico: Reduction operator REDUCE
*    " Descrição: Redução de tabelas internas com loops explícitos antes do ABAP 7.50.
*    " ----------------------------------------------------------------------
    DATA lt_numbers_old TYPE STANDARD TABLE OF i WITH EMPTY KEY.
*
    lt_numbers_old = VALUE #( ( 1 ) ( 2 ) ( 3 ) ).

    DATA(lv_sum) = REDUCE #( INIT x = 0
                             FOR ls_numbers_old
                             IN lt_numbers_old
                             NEXT x += ls_numbers_old ).

    out->write( |Old Version - Sum: { lv_sum }| ).
*
*    " ----------------------------------------------------------------------
*    " Tópico: Conditional operators COND and SWITCH
*    " Descrição: Expressões condicionais com IF/ELSEIF/ELSE e CASE antes do ABAP 7.40.
*    " ----------------------------------------------------------------------
    DATA(lv_code) = 1.

    DATA(lv_status) = COND #( WHEN lv_code = 1 THEN 'Success' WHEN lv_code = 2 THEN 'Warning' ELSE 'Error' ).

    out->write( |Old Version - Status (COND): { lv_code }| ).

    lv_code = 2.
    lv_status = SWITCH #( lv_code WHEN 1 THEN 'Success' WHEN 2 THEN 'Warning' ELSE 'Error' ).

    out->write( |Old Version - Status (SWITCH): { lv_code }| ).
*
*    " ----------------------------------------------------------------------
*    " Tópico: Strings
*    " Descrição: Manipulação de strings antes do ABAP 7.40.
*    " ----------------------------------------------------------------------
    CONSTANTS lc_str TYPE string VALUE 'Old Version - String Template (Strings):'.

    DATA(lv_var1_str_old) = 'Hello'.
    DATA(lv_var2_str_old) = 'World'.

    out->write( |{ lc_str } { lv_var1_str_old && lv_var2_str_old }| ).

    DATA lv_string_sub_old TYPE string VALUE 'ABCDEFG'.
*    " ----------------------------------------------------------------------
*    " Tópico: Loop at Group By
*    " Descrição: Agrupamento de dados em loops de tabelas internas antes do ABAP 7.50.
*    " ----------------------------------------------------------------------
    TYPES: BEGIN OF ty_flight_group_old,
             carrid TYPE /dmo/carrier_id,
             connid TYPE /dmo/connection_id,
             price  TYPE /dmo/flight_price,
           END OF ty_flight_group_old.

    DATA lt_flights_group_old TYPE SORTED TABLE OF ty_flight_group_old WITH NON-UNIQUE KEY carrid connid.

    lt_flights_group_old = VALUE #( ( carrid = 'LH' connid = '0400' price  = '100' )
                                    ( carrid = 'LH' connid = '0401' price  = '150' )
                                    ( carrid = 'UA' connid = '0001' price  = '200' )
                                  ).

    LOOP AT lt_flights_group_old INTO DATA(ls_flights_group_old) GROUP BY ls_flights_group_old-carrid.

      DATA(lv_price) = REDUCE #( INIT x = 0
                                 FOR ls_flights_group
                                 IN lt_flights_group_old
                                 WHERE ( carrid = ls_flights_group_old-carrid )
                                 NEXT x += ls_flights_group-price ).

      out->write( |New Version - Carrier { ls_flights_group_old-carrid } Total Price (Group By): { lv_price }| ).

      CLEAR lv_price.

    ENDLOOP.

** ----------------------------------------------------------------------
** Tópico: Filter
** Descrição: Filtragem de tabelas internas com loops explícitos antes do ABAP 7.40.
** ----------------------------------------------------------------------
*    DATA: lt_flights_filter_old TYPE STANDARD TABLE OF ty_flight_old.
*
*    LOOP AT lt_flights_value_old INTO ls_flight_old WHERE carrid = 'UA'.
*      APPEND ls_flight_old TO lt_flights_filter_old.
*    ENDLOOP.
*
*    out->write( |Old Version - Filtered flights (Filter): { lines( lt_flights_filter_old ) }| ).

  ENDMETHOD.
ENDCLASS.
