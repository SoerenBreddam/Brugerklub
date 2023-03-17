﻿SELECT
				BBR_Aktiv_Bygning.KommuneNr,
				BBR_Aktiv_Bygning.Bygningsnummer,
				BBR_Aktiv_Bygning.Ejendomsnummer,
				BBR_Aktiv_Bygning.BFEnr,
				BBR_Aktiv_Bygning.BygningensAnvendelseKode,
				Case
				When BBR_Aktiv_Bygning.BygningensAnvendelse like '(Udfases)%'
				Then Right(BBR_Aktiv_Bygning.BygningensAnvendelse, len(BBR_Aktiv_Bygning.BygningensAnvendelse)-10)
				Else BBR_Aktiv_Bygning.BygningensAnvendelse
				End AS BygningensAnvendelse,
				DAR_AKTIVE_ADRESSER.Enh_Adresse,
				DAR_AKTIVE_ADRESSER.VejNavn + ' ' + DAR_AKTIVE_ADRESSER.Husnummer AS Adgangsadresse,
				DAR_AKTIVE_ADRESSER.ByNavn,
				DAR_AKTIVE_ADRESSER.PostNr,
				DAR_AKTIVE_ADRESSER.Postdistrikt,
				BBR_Aktiv_Bygning.AntalEnhederMedKoekken,
				BBR_Aktiv_Bygning.AntalEnhederUdenKoekken,
				BBR_Aktiv_Bygning.Opfoerelsesaar,
				BBR_Aktiv_Bygning.OmTilbygningsaar,
				BBR_Aktiv_Bygning.DatoMidlertidigOpfoertBygning,
				BBR_Aktiv_Bygning.VandforsyningKode,
				BBR_Aktiv_Bygning.Vandforsyning,
				BBR_Aktiv_Bygning.AfloebsforholdKode,
				BBR_Aktiv_Bygning.Afloebsforhold,
				BBR_Aktiv_Bygning.YdervaeggensMaterialeKode,
				BBR_Aktiv_Bygning.YdervaeggensMateriale,
				BBR_Aktiv_Bygning.TagdaekningsmaterialeKode,
				BBR_Aktiv_Bygning.Tagdaekningsmateriale,
				BBR_Aktiv_Bygning.SuppYdervaegMaterialeKode,
				BBR_Aktiv_Bygning.SuppYdervaegMateriale,
				BBR_Aktiv_Bygning.SuppTagdaekningsMaterialeKode,
				BBR_Aktiv_Bygning.SuppTagdaekningsMateriale,
				BBR_Aktiv_Bygning.AsbestholdigtMaterialeKode,
				BBR_Aktiv_Bygning.AsbestholdigtMateriale,
				BBR_Aktiv_Bygning.KildeBygningensMaterialerKode,
				BBR_Aktiv_Bygning.KildeTilBygningensMaterialer,
				BBR_Aktiv_Bygning.SamletBygningsareal,
				BBR_Aktiv_Bygning.BygningensSamledeBoligAreal,
				BBR_Aktiv_Bygning.BygningensSamledeErhvervsAreal,
				BBR_Aktiv_Bygning.BebyggetAreal,
				BBR_Aktiv_Bygning.ArealIndbyggetGarage,
				BBR_Aktiv_Bygning.ArealIndbyggetCarport,
				BBR_Aktiv_Bygning.ArealIndbyggetUdhus,
				BBR_Aktiv_Bygning.ArealIndbyggetUdestueEllerLign,
				BBR_Aktiv_Bygning.SamletArealLukOverdaekPaaByg,
				BBR_Aktiv_Bygning.ArealAffaldsrumITerraenniveau,
				BBR_Aktiv_Bygning.AndetAreal,
				BBR_Aktiv_Bygning.ArealAfOverdaekketAreal,
				BBR_Aktiv_Bygning.ArealAabneOverdaekBygSamlet,
				BBR_Aktiv_Bygning.Adgangsareal,
				BBR_Aktiv_Bygning.BeregnPrincipCarportArealKode,
				BBR_Aktiv_Bygning.BeregnPrincipCarportAreal,
				BBR_Aktiv_Bygning.BygningsarealerKildeKode,
				BBR_Aktiv_Bygning.BygningsarealerKilde,
				BBR_Aktiv_Bygning.AntalEtager,
				BBR_Aktiv_Bygning.AfvigendeEtagerKode,
				BBR_Aktiv_Bygning.AfvigendeEtager,
				BBR_Aktiv_Bygning.VarmeinstallationKode,
				BBR_Aktiv_Bygning.Varmeinstallation,
				BBR_Aktiv_Bygning.OpvarmningsmiddelKode,
				BBR_Aktiv_Bygning.Opvarmningsmiddel,
				BBR_Aktiv_Bygning.SupplerendeVarmeKode,
				BBR_Aktiv_Bygning.SupplerendeVarme,
				BBR_Aktiv_Bygning.Sikringsrumpladser,
				BBR_Aktiv_Bygning.FredningKode,
				BBR_Aktiv_Bygning.Fredning,
				BBR_Aktiv_Bygning.BevaringsvaerdighedReference,
				BBR_Aktiv_Bygning.Revisionsdato,
				BBR_Aktiv_Bygning.StormraadOversvoemSelvrisiKode,
				BBR_Aktiv_Bygning.StormraadOversvoemSelvrisiko,
				BBR_Aktiv_Bygning.DatoRegistreringFraStormraadet,
				BBR_Aktiv_Bygning.ByggeskadeForsikrSelskabKode,
				BBR_Aktiv_Bygning.ByggeskadeForsikrSelskab,
				BBR_Aktiv_Bygning.DatoForByggeskadeforsikring,
				BBR_Aktiv_Bygning.UdledningstilladelseKode,
				BBR_Aktiv_Bygning.Udledningstilladelse,
				BBR_Aktiv_Bygning.OmfatByggeskadeforsikringKode,
				BBR_Aktiv_Bygning.OmfatByggeskadeforsikring,
				BBR_Aktiv_Bygning.Gyldighedsdato,
				BBR_Aktiv_Bygning.MedlemSpildevandsforsyningKode,
				BBR_Aktiv_Bygning.MedlemSpildevandsforsyning,
				BBR_Aktiv_Bygning.PaabudSpildevandsafledningKode,
				BBR_Aktiv_Bygning.PaabudSpildevandsafledning,
				BBR_Aktiv_Bygning.FristSpildevandsafledningDato,
				BBR_Aktiv_Bygning.TilladelseTilUdtraedenKode,
				BBR_Aktiv_Bygning.TilladelseTilUdtraeden,
				BBR_Aktiv_Bygning.DatoForTilladelseTilUdtraeden,
				BBR_Aktiv_Bygning.TilladelseAltBortskaffelseKode,
				BBR_Aktiv_Bygning.TilladelseAltBortskaffelse,
				BBR_Aktiv_Bygning.DatoTilladelseAltBortskaffelse,
				BBR_Aktiv_Bygning.ArealAfUdvendigEfterisolering,
				BBR_Aktiv_Bygning.DispFriKollektivVarmeforKode,
				BBR_Aktiv_Bygning.DispFriKollektivVarmefor,
				BBR_Aktiv_Bygning.DatoDispFritKollektivVarmefor,
				BBR_Aktiv_Bygning.KildeTilKoordinatsaetKode,
				BBR_Aktiv_Bygning.KildeTilKoordinatsaet,
				BBR_Aktiv_Bygning.KvalitetAfKoordinatsaetKode,
				BBR_Aktiv_Bygning.KvalitetAfKoordinatsaet,
				BBR_Aktiv_Bygning.SuppOplysningKoordinatsaetKode,
				BBR_Aktiv_Bygning.SuppOplysningKoordinatsaet,
				BBR_Aktiv_Bygning.PlaceringPaaSoeterritorieKode,
				BBR_Aktiv_Bygning.PlaceringPaaSoeterritorie,
				BBR_Aktiv_Bygning.BanedanmarkBygvaerksnummer,
				BBR_Aktiv_Bygning.ServitutUdlejningsEjendomDato,
				BBR_Aktiv_Bygning.GulvbelaegningKode,
				BBR_Aktiv_Bygning.Gulvbelaegning,
				BBR_Aktiv_Bygning.Frihoejde,
				BBR_Aktiv_Bygning.AabenLukketKonstruktionKode,
				BBR_Aktiv_Bygning.AabenLukketKonstruktion,
				BBR_Aktiv_Bygning.KonstruktionsforholdKode,
				BBR_Aktiv_Bygning.Konstruktionsforhold,
				BBR_Aktiv_Bygning.TypeAfFlytningKode,
				BBR_Aktiv_Bygning.TypeAfFlytning,
				BBR_Aktiv_Bygning.TilflytterKommuneNr,
				BBR_Aktiv_Bygning.OevrigeBemaerkningStormraadet,
				BBR_Aktiv_Bygning.SamletTagetageAreal_SumBygning,
				BBR_Aktiv_Bygning.ArealUdnytDelTagetage_Sum,
				BBR_Aktiv_Bygning.TagetagensAdgangsareal_Sum,
				BBR_Aktiv_Bygning.SamletArealAfKaelderetager_Sum,
				BBR_Aktiv_Bygning.Kaelderareal_SumBygning,
				BBR_Aktiv_Bygning.ErhvervIKaelder_SumBygning,
				BBR_Aktiv_Bygning.ArealLovligBeboelseKaelder_Sum,
				BBR_Aktiv_Bygning.KaelderEtagensAdgangsareal_Sum,
				BBR_Aktiv_Bygning.KoorOest,
				BBR_Aktiv_Bygning.KoorNord,
				BBR_Aktiv_Bygning.KoordinatsystemKode,
				BBR_Aktiv_Bygning.Koordinatsystem,
				BBR_Aktiv_Bygning.Geometri,
				CAST('Pen (1,2,0) Brush (1,0,16777215) Symbol (51,255,9,"MapInfo Symbols",0,0)' AS varchar(100)) AS MI_STYLE,
				CAST(BBR_Aktiv_Bygning.BygningID AS varchar(38)) AS BygningID,
				CAST(BBR_Aktiv_Bygning.JordstykkeID AS varchar(38)) AS JordstykkeID,
				CAST(BBR_Aktiv_Bygning.HusnummerID AS varchar(38)) AS HusnummerID,
				CAST(BBR_Aktiv_Bygning.EjerlejligBestemtFastEjendomID AS varchar(38)) AS EjerlejligBestemtFastEjendomID,
				CAST(BBR_Aktiv_Bygning.GrundID AS varchar(38)) AS GrundID,
				CAST(BBR_Aktiv_Bygning.BestemtFastEjendomID AS varchar(38)) AS BestemtFastEjendomID,
				BBR_Aktiv_Bygning.Geometri_Hash,
				BBR_Aktiv_Bygning.TS,
				CAST(BBR_Aktiv_Bygning.zId AS varchar(38)) AS zId
FROM
				BBR_Aktiv_Bygning LEFT OUTER JOIN
				DAR_AKTIVE_ADRESSER ON BBR_Aktiv_Bygning.HusnummerID = DAR_AKTIVE_ADRESSER.HusnummerID