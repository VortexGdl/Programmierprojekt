@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Value Help for Customer'

@Search.searchable: true

define view entity ZI_D_CUSTOMERVH
  as select from /dmo/customer

{
  key customer_id  as CustomerId,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      first_name   as FirstName,

      @Search.fuzzinessThreshold: 0.8
      last_name    as LastName,

      @Search.fuzzinessThreshold: 0.8

      title        as Title,

      @Search.fuzzinessThreshold: 0.8

      street       as Street,

      @Search.fuzzinessThreshold: 0.8

      postal_code  as PostalCode,

      @Search.fuzzinessThreshold: 0.8

      city         as City,

      country_code as CountryCode
}
