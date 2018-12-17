SELECT
    `XSD_VAI_MGG_XNI`.`fidbNo` AS 'Vendor Event ID'
    , `XSD_VAI_MGG`.`XSD_VAI_instrSym` AS 'Valor'
    , `XSD_VAI_MGG`.`eventID` AS 'Tax Event ID'
    , `XSD_VAI_MGG`.`eventDate` AS 'Date Event Entered'
    , `XSD_VAI_MGG`.`eventNo` AS 'Tax Event No'
    , `XSD_VAI_MGG_LRI`.`locSym` AS 'Tax Country Viewpoint'
    , `XSD_VAI_MGG_REF`.`eventID` AS 'Underlying Event Type'
     , `XSD_VAI_MGG_XSB`.`taxCateg` AS 'Tax Category'
    , `XSD_VAI_MGG_XSB_XSC`.`resNonresCode` AS 'Tax Residency'
    , `XSD_VAI_MGG_XSB_XSC_XSE`.`taxAmType` AS 'Tax Amount Type'
     , `XSD_VAI_MGG_XSB_XSC_XSE`.`curr` AS 'Tax Amount Currency'
    , `XSD_VAI_MGG_XSB_XSC_XSE`.`amt` AS 'Tax Amount'
    , `XSD_VAI_MGG_XSB_XSC_XSE`.`quote` AS 'Tax Amount Quotation Type'
FROM
    `vdf_201302`.`XSD_VAI_MGG_XNI`
    INNER JOIN `vdf_201302`.`XSD_VAI_MGG`
        ON (`XSD_VAI_MGG_XNI`.`XSD_VAI_MGG_eventID` = `XSD_VAI_MGG`.`eventID`) AND (`XSD_VAI_MGG_XNI`.`XSD_VAI_MGG_eventDate` = `XSD_VAI_MGG`.`eventDate`) AND (`XSD_VAI_MGG_XNI`.`XSD_VAI_MGG_eventNo` = `XSD_VAI_MGG`.`eventNo`) AND (`XSD_VAI_MGG_XNI`.`XSD_VAI_instrIDSchemeID` = `XSD_VAI_MGG`.`XSD_VAI_instrIDSchemeID`) AND (`XSD_VAI_MGG_XNI`.`XSD_VAI_instrSym` = `XSD_VAI_MGG`.`XSD_VAI_instrSym`)
    INNER JOIN `vdf_201302`.`XSD_VAI_MGG_REF`
        ON (`XSD_VAI_MGG_REF`.`XSD_VAI_MGG_eventID` = `XSD_VAI_MGG`.`eventID`) AND (`XSD_VAI_MGG_REF`.`XSD_VAI_MGG_eventDate` = `XSD_VAI_MGG`.`eventDate`) AND (`XSD_VAI_MGG_REF`.`XSD_VAI_MGG_eventNo` = `XSD_VAI_MGG`.`eventNo`) AND (`XSD_VAI_MGG_REF`.`XSD_VAI_instrIDSchemeID` = `XSD_VAI_MGG`.`XSD_VAI_instrIDSchemeID`) AND (`XSD_VAI_MGG_REF`.`XSD_VAI_instrSym` = `XSD_VAI_MGG`.`XSD_VAI_instrSym`)
    INNER JOIN `vdf_201302`.`XSD_VAI_MGG_LRI`
        ON (`XSD_VAI_MGG_LRI`.`XSD_VAI_MGG_eventID` = `XSD_VAI_MGG`.`eventID`) AND (`XSD_VAI_MGG_LRI`.`XSD_VAI_MGG_eventDate` = `XSD_VAI_MGG`.`eventDate`) AND (`XSD_VAI_MGG_LRI`.`XSD_VAI_MGG_eventNo` = `XSD_VAI_MGG`.`eventNo`) AND (`XSD_VAI_MGG_LRI`.`XSD_VAI_instrIDSchemeID` = `XSD_VAI_MGG`.`XSD_VAI_instrIDSchemeID`) AND (`XSD_VAI_MGG_LRI`.`XSD_VAI_instrSym` = `XSD_VAI_MGG`.`XSD_VAI_instrSym`)
    INNER JOIN `vdf_201302`.`XSD_VAI_MGG_XSB`
        ON (`XSD_VAI_MGG_XSB`.`XSD_VAI_MGG_eventID` = `XSD_VAI_MGG`.`eventID`) AND (`XSD_VAI_MGG_XSB`.`XSD_VAI_MGG_eventDate` = `XSD_VAI_MGG`.`eventDate`) AND (`XSD_VAI_MGG_XSB`.`XSD_VAI_MGG_eventNo` = `XSD_VAI_MGG`.`eventNo`) AND (`XSD_VAI_MGG_XSB`.`XSD_VAI_instrIDSchemeID` = `XSD_VAI_MGG`.`XSD_VAI_instrIDSchemeID`) AND (`XSD_VAI_MGG_XSB`.`XSD_VAI_instrSym` = `XSD_VAI_MGG`.`XSD_VAI_instrSym`)
    INNER JOIN `vdf_201302`.`XSD_VAI_MGG_XSB_XSC`
        ON (`XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_MGG_XSB_taxCateg` = `XSD_VAI_MGG_XSB`.`taxCateg`) AND (`XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_MGG_eventID` = `XSD_VAI_MGG_XSB`.`XSD_VAI_MGG_eventID`) AND (`XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_MGG_eventDate` = `XSD_VAI_MGG_XSB`.`XSD_VAI_MGG_eventDate`) AND (`XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_MGG_eventNo` = `XSD_VAI_MGG_XSB`.`XSD_VAI_MGG_eventNo`) AND (`XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_instrIDSchemeID` = `XSD_VAI_MGG_XSB`.`XSD_VAI_instrIDSchemeID`) AND (`XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_instrSym` = `XSD_VAI_MGG_XSB`.`XSD_VAI_instrSym`)
    INNER JOIN `vdf_201302`.`XSD_VAI_MGG_XSB_XSC_XSE`
        ON (`XSD_VAI_MGG_XSB_XSC_XSE`.`XSD_VAI_MGG_XSB_XSC_resNonresCode` = `XSD_VAI_MGG_XSB_XSC`.`resNonresCode`) AND (`XSD_VAI_MGG_XSB_XSC_XSE`.`XSD_VAI_MGG_XSB_taxCateg` = `XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_MGG_XSB_taxCateg`) AND (`XSD_VAI_MGG_XSB_XSC_XSE`.`XSD_VAI_MGG_eventID` = `XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_MGG_eventID`) AND (`XSD_VAI_MGG_XSB_XSC_XSE`.`XSD_VAI_MGG_eventDate` = `XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_MGG_eventDate`) AND (`XSD_VAI_MGG_XSB_XSC_XSE`.`XSD_VAI_MGG_eventNo` = `XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_MGG_eventNo`) AND (`XSD_VAI_MGG_XSB_XSC_XSE`.`XSD_VAI_instrIDSchemeID` = `XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_instrIDSchemeID`) AND (`XSD_VAI_MGG_XSB_XSC_XSE`.`XSD_VAI_instrSym` = `XSD_VAI_MGG_XSB_XSC`.`XSD_VAI_instrSym`)
WHERE XSD_VAI_MGG_XNI.`fidbNo`='236211469'
