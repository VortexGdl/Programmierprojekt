@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Custommer Consumption View'

@Metadata.allowExtensions: true

define root view entity ZC_D_CustomerTP provider contract transactional_query
  as projection on ZR_D_CustomerTP2

{
  key CustomerId,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_D_CustomerVH', element: 'CustomerId' } } ]
//      @ObjectModel.text.element: [ 'Customer' ]
      Customer,

      Street,
      PostalCode,
      City,
      CountryCode,
      PhoneNumber,
      EmailAddress,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Bookings   : redirected to composition child ZC_D_BookingTP
}
