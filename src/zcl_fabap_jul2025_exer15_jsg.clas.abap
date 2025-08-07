CLASS zcl_fabap_jul2025_exer15_jsg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer15_jsg IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/flight AS f
           INNER JOIN /dmo/connection AS c
           ON  c~carrier_id = f~carrier_id
           AND c~connection_id = f~connection_id
           FIELDS f~carrier_id, f~connection_id, f~price
           WHERE c~distance > 1000
           AND f~carrier_id   = 'UA'
           INTO TABLE @DATA(lt_flights).

    SORT lt_flights BY carrier_id connection_id.

    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flights>).

      <fs_flights>-price = <fs_flights>-price * '1.10'.
      ##NO_TEXT      out->write( |Preço atualizado para voo { <fs_flights>-carrier_id }-{ <fs_flights>-connection_id }| ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
