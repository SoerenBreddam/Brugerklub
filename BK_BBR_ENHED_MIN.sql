SELECT
				BBR_Aktiv_Enhed.KommuneNr,
				BBR_Aktiv_Enhed.Ejendomsnummer,
				BBR_Aktiv_Enhed.BFEnr,
				BBR_Aktiv_Enhed.Ejendomstype,
				BBR_Aktiv_Enhed.EnhedensAnvendelseKode,
				BBR_Aktiv_Enhed.EnhedensAnvendelse,
				BBR_Aktiv_Enhed.BoligtypeKode,
				BBR_Aktiv_Enhed.Boligtype,
				DAR_AKTIVE_ADRESSER.Enh_Adresse,
				DAR_AKTIVE_ADRESSER.VejNavn + ' ' + DAR_AKTIVE_ADRESSER.Husnummer AS Adgangsadresse,
				DAR_AKTIVE_ADRESSER.ByNavn,
				DAR_AKTIVE_ADRESSER.PostNr,
				DAR_AKTIVE_ADRESSER.Postdistrikt,
				BBR_Aktiv_Enhed.EnhedensSamledeAreal,
				BBR_Aktiv_Enhed.ArealTilBeboelse,
				BBR_Aktiv_Enhed.ArealTilErhverv,
				BBR_Aktiv_Enhed.AndetAreal,
				BBR_Aktiv_Enhed.ArealAfaabenOverdaekning,
				BBR_Aktiv_Enhed.ArealLukketOverdaekningUdestue,
				DAR_AKTIVE_ADRESSEPUNKTER.Geometri,
				CAST('Pen (1,2,0) Brush (1,0,16777215) Symbol (51,255,9,"MapInfo Symbols",0,0)' AS varchar(100)) AS MI_STYLE
FROM
				DAR_AKTIVE_ADRESSEPUNKTER RIGHT OUTER JOIN
				DAR_AKTIVE_ADRESSER ON DAR_AKTIVE_ADRESSEPUNKTER.AdressepunktID = DAR_AKTIVE_ADRESSER.AdressepunktID RIGHT OUTER JOIN
				BBR_Aktiv_Enhed ON DAR_AKTIVE_ADRESSER.HusnummerID = BBR_Aktiv_Enhed.HusnummerID