@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Flight Interface'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define view entity ZI_D_Flight2
  as select from /dmo/flight

  association [1..1] to /dmo/connection as _Connections on $projection.ConnectionId = _Connections.connection_id

  association [1..1] to /dmo/airport    as _AirportFrom on $projection.AirPortFromId = _AirportFrom.airport_id
  association [1..1] to /dmo/airport    as _AirportTo   on $projection.AirportToId = _AirportTo.airport_id
  association [1..1] to /dmo/carrier    as _Carrier     on $projection.CarrierId = _Carrier.carrier_id

{
  key carrier_id                   as CarrierId,
  key connection_id                as ConnectionId,
  key flight_date                  as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                        as Price,

      currency_code                as CurrencyCode,
      plane_type_id                as PlaneTypeId,
      seats_max                    as SeatsMax,
      seats_occupied               as SeatsOccupied,
      _Connections.airport_from_id as AirPortFromId,
      _Connections.airport_to_id   as AirportToId,
      _Connections.arrival_time    as ArrivalTime,
      _Connections.departure_time  as DepartureTime,
      _Connections.distance        as Distance,
      _Connections. distance_unit  as DistanceUnit,

      _Connections,
      _AirportTo,
      _Carrier,
      _AirportFrom,
      
         @Semantics.imageUrl: true
      case carrier_id
      when 'AA' then 'https://cdn.aptoide.com/imgs/d/f/a/dfa1f84256c1410ca99ac7bf548ed7e6_icon.png'
      when 'AC' then 'https://companieslogo.com/img/orig/AC.TO-01622528.png?t=1720244490'
      when 'AF' then 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Air_France_logo_%281976-1990%29.svg/1280px-Air_France_logo_%281976-1990%29.svg.png'
      when 'AZ' then 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Alitalia_Logo_2017%E2%80%932021.svg/3840px-Alitalia_Logo_2017%E2%80%932021.svg.png'
      when 'BA' then 'https://img.icons8.com/color/1200/british-airways.jpg'
      when 'CO' then 'https://news.gtp.gr/wp-content/uploads/2018/01/Cobalt-Air-logo.jpg'
      when 'DL' then 'https://deltamuseum.org/images/site/research/delta-brand/logos/16-9-logos/1962to1993_delta_logo.webp?sfvrsn=c7d656cf_1'
      when 'FJ' then ''
      when 'JL' then 'https://play-lh.googleusercontent.com/HmFickfWrOnPNIayhuFn9F1MQLzLQG7l9aElCpqVxs0FBGqA5AlzKOiMgwdhoS7seQ'
      when 'LH' then 'https://img.icons8.com/external-tal-revivo-shadow-tal-revivo/1200/external-lufthansa-is-the-largest-german-airline-which-automotive-shadow-tal-revivo.jpg'
      when 'NG' then ''
      when 'QF' then ''
      when 'SA' then ''
      when 'SQ' then 'https://cdn.freebiesupply.com/logos/large/2x/singapore-airlines-logo-png-transparent.png'
      when 'SR' then ''
      when 'UA' then 'https://play-lh.googleusercontent.com/ksMkNKYrH89qrIvuoLOtgElqPqjFMyHaWStkTTZGqWMCymFI6FW3uwyuLWyZxlVgwXc'
      else '/sap/bc/ui5_ui5/sap/flights/images/default.png'
      end    as CarrierImageUrl
}
