CLASS zfosl_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zfosl_data_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE FROM ('zfosl_travel_m').
    " insert travel demo data
    INSERT ('zfosl_travel_m')  FROM (
        SELECT
          FROM ('/DMO/TRAVEL as travel')
          FIELDS

            travel~travel_id        AS travel_id,
            travel~agency_id        AS agency_id,
            travel~customer_id      AS customer_id,
            travel~begin_date       AS begin_date,
            travel~end_date         AS end_date,
            travel~booking_fee      AS booking_fee,
            travel~total_price      AS total_price,
            travel~currency_code    AS currency_code,
            travel~description      AS description,
            CASE travel~status    "Status [N(New) | P(Planned) | B(Booked) | X(Cancelled)]
              WHEN 'B' THEN 'A'
              WHEN 'X' THEN 'X'
              ELSE 'O'
            END                     AS overall_status,  "Travel Status [A(Accepted) | O(Open) | X(Cancelled)]
            travel~createdby        AS created_by,
            travel~createdat        AS created_at,
            travel~lastchangedby    AS last_changed_by,
            travel~lastchangedat    AS last_changed_at

            ORDER BY travel_id UP TO 50 ROWS
      ).
    COMMIT WORK.
    " define FROM clause dynamically
    DATA: dyn_table_name TYPE string.
    dyn_table_name = | /dmo/booking    AS booking  |
                 && | JOIN { 'zfosl_travel_m' } AS z |
                 && | ON   booking~travel_id = z~travel_id |.
    DELETE FROM ('zfosl_booking_m').
    " insert booking demo data
    INSERT ('zfosl_booking_m') FROM (
        SELECT
          FROM (dyn_table_name)
          FIELDS

             z~travel_id             AS travel_id           ,
             booking~booking_id      AS booking_id            ,
             booking~booking_date    AS booking_date          ,
             booking~customer_id     AS customer_id           ,
             booking~carrier_id      AS carrier_id            ,
             booking~connection_id   AS connection_id         ,
             booking~flight_date     AS flight_date           ,
             booking~flight_price    AS flight_price          ,
             booking~currency_code   AS currency_code         ,
             CASE z~overall_status    ""Travel Status [A(Accepted) | O(Open) | X(Cancelled)]
               WHEN 'O' THEN 'N'
               WHEN 'P' THEN 'N'
               WHEN 'A' THEN 'B'
               ELSE 'X'
             END                     AS booking_status,   "Booking Status [N(New) | B(Booked) | X(Cancelled)]
             z~last_changed_at       AS last_changed_at
      ).
    COMMIT WORK.

    " define FROM clause dynamicall/dmo/supplement
    DATA: dyn_table_name1 TYPE string.
    dyn_table_name1 = | /dmo/book_suppl    AS supplement  |
                 && | JOIN { 'zfosl_booking_m' } AS b |
                 && | ON   supplement~travel_id = b~travel_id |
                 && | AND  supplement~booking_id = b~booking_id |.
    DELETE FROM ('zfosl_booksupp_m').
    " insert booking demo data
    INSERT ('zfosl_booksupp_m') FROM (
        SELECT
          FROM (dyn_table_name1)
          FIELDS

            b~travel_id             AS travel_id,
            b~booking_id            AS booking_id,
            supplement~booking_supplement_id    AS booking_supplement_id,
            supplement~supplement_id            AS supplement_id,
            supplement~price                    AS price,
            supplement~currency_code            AS currency_code,
            b~last_changed_at                   AS last_changed_at


      ).
    COMMIT WORK.

    out->write( 'Success' ).

  ENDMETHOD.
ENDCLASS.
