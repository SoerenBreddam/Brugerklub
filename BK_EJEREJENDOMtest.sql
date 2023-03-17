SELECT
				MAT_Aktiv_SamletFastEjendom.KommuneNr,
				Ejertabel.BFE_NUMMER,
				Ejertabel.Ejendomsbeliggenhed,
				Ejertabel.Ejers_navn,
				Ejertabel.Ejers_CO_navn,
				Ejertabel.Ejers_adresse,
				Ejertabel.Ejers_udvidede_adresse,
				Ejertabel.Postdistrikt,
				Ejertabel.Benyttelseskode,
				Ejertabel.Benyttelse,
				Ejertabel.Ejers_statuskode,
				Ejertabel.Ejerstatus,
				Ejertabel.Pensionistkode,
				Ejertabel.Pensioniststatus,
				Ejertabel.Lejeværdikode,
				Ejertabel.Lejeværdi,
				Ejertabel.Kode_for_adressebeskyttelse,
				Ejertabel.Adressebeskyttelse,
				Ejertabel.Slutseddeldato,
				Ejertabel.Skødedato,
				Ejertabel.Overtagelsesdato,
				Ejertabel.Overdragelsesmåde,
				Ejertabel.Købesum,
				Ejertabel.Køberandel,
				Ejertabel.Ejerandel,
				Ejertabel.Ejer_CPR_CVR,
				Ejertabel.Ejendomsareal,
				Ejertabel.Heraf_vejareal,
				Ejertabel.Vurderet_areal,
				Ejertabel.Heraf_vurderet_vejareal,
				Ejertabel.Ejerforholdskode,
				Ejertabel.Ejerforhold,
				Ejertabel.Antal_ejere,
				Ejertabel.Antal_lejligheder,
				Ejertabel.Moderejendomsnummer,
				Ejertabel.Adgang_til_offentlig_vej,
				Ejertabel.Admin_adressebeskyttelse,
				Ejertabel.Administrators_navn,
				Ejertabel.Administrators_CO_navn,
				Ejertabel.Administrators_adresse,
				Ejertabel.Administrators_udv_adresse,
				Ejertabel.Administrators_postdistrikt,
				Ejertabel.Administratornummer,
				Ejertabel.Administrators_CPR_CVR,
				Ejertabel.Administratorkode,
				Ejertabel.Administratorstatus,
				MAT_Aktiv_SamletFastEjendom.geometri,
				MAT_Aktiv_SamletFastEjendom.SFEObjectID AS MI_PRINX,
				CAST('Pen (1, 2, 0) Brush (1, 0, 16777215) Symbol (49,0,12)' AS char(150)) AS MI_STYLE
FROM
				(SELECT DISTINCT
				CO11800T.BFE_NUMMER,
				JY67500V_T.ABELIG AS Ejendomsbeliggenhed,
				JY64900V.ANAVN AS Ejers_navn,
				JY64900V.ACONAVN AS Ejers_CO_navn,
				JY64900V.AADRESS AS Ejers_adresse,
				JY64900V.AUDVADR AS Ejers_udvidede_adresse,
				JY64900V.APOST AS Postdistrikt,
				JY67500V_T.CBENYT AS Benyttelseskode,
				CAST(QL61500V_T.TEKST AS VARCHAR(70)) AS Benyttelse,
				JY64900V.CMSTAT AS Ejers_statuskode,
				CAST(QL63200V_T.TEKST AS VARCHAR(75)) AS Ejerstatus,
				JY64900V.CPENS AS Pensionistkode,
				CAST(QL63400V_T.TEKST AS VARCHAR(75)) AS Pensioniststatus,
				JY64900V.CLEJE AS Lejeværdikode,
				CAST(QL63500V_T.TEKST AS VARCHAR(75)) AS Lejeværdi,
				JY64900V.CBSKADR AS Kode_for_adressebeskyttelse,
				CAST(QL63600V_T.TEKST AS VARCHAR(75)) AS Adressebeskyttelse,
				JY64900V.DSLUTS AS Slutseddeldato,
				JY64900V.DSKOED AS Skødedato,
				JY64900V.DOVTG AS Overtagelsesdato,
				CAST(QL63700V_T.TEKST AS VARCHAR(75)) AS Overdragelsesmåde,
				JY64900V.BKOEBS AS Købesum,
				CAST(CAST(JY64900V.GKOETAEL AS varchar(6)) + '/' + CAST(JY64900V.GKOENAEV AS varchar(6)) AS varchar(12)) AS Køberandel,
				CAST(CAST(JY64900V.GEJTAEL AS varchar(6)) + '/' + CAST(JY64900V.GEJNAEV AS varchar(6)) AS varchar(12)) AS Ejerandel,
				JY64900V.DCPRCIR AS Ejer_CPR_CVR,
				JY67500V_T.FTOTAR AS Ejendomsareal,
				JY67500V_T.FTOTVEJ AS Heraf_vejareal,
				JY67500V_T.FARVUR AS Vurderet_areal,
				JY67500V_T.FVEJVUR AS Heraf_vurderet_vejareal,
				JY67500V_T.CEJFORH AS Ejerforholdskode,
				CAST(QL50000V_T.TEKST AS VARCHAR(133)) AS Ejerforhold,
				JY67500V_T.FEJER AS Antal_ejere,
				JY67500V_T.FLEJL AS Antal_lejligheder,
				JY67500V_T.EMODER AS Moderejendomsnummer,
				JY67500V_T.COFVEJ AS Adgang_til_offentlig_vej,
				JY67500V_T.CBSKADRA AS Admin_adressebeskyttelse,
				JY67500V_T.AANAVN AS Administrators_navn,
				JY67500V_T.AACONAVN AS Administrators_CO_navn,
				JY67500V_T.AAADRESS AS Administrators_adresse,
				JY67500V_T.AAUDVADR AS Administrators_udv_adresse,
				JY67500V_T.AAPOST AS Administrators_postdistrikt,
				JY67500V_T.EADMNR AS Administratornummer,
				JY67500V_T.DCPRADM AS Administrators_CPR_CVR,
				JY67500V_T.CADM AS Administratorkode,
				QL65000V_T.TEKST AS Administratorstatus
		FROM
				QL61500V_T LEFT OUTER JOIN
				QL63400V_T LEFT OUTER JOIN
				QL63700V_T RIGHT OUTER JOIN
				JY67500V_T INNER JOIN
				JY64900V INNER JOIN
				CO11800T ON JY64900V.EEJDNR = CO11800T.EJD_NR ON JY67500V_T.EEJDNR = JY64900V.EEJDNR ON QL63700V_T.KODE = JY64900V.COVMD ON QL63400V_T.KODE = JY64900V.CPENS LEFT OUTER JOIN
				QL63200V_T ON JY64900V.CMSTAT = QL63200V_T.KODE LEFT OUTER JOIN
				QL63500V_T ON JY64900V.CLEJE = QL63500V_T.KODE LEFT OUTER JOIN
				QL50000V_T ON JY64900V.CEJFORH = QL50000V_T.KODE LEFT OUTER JOIN
				QL63600V_T ON JY64900V.CBSKADR = QL63600V_T.KODE RIGHT OUTER JOIN
				QL65000V_T ON JY67500V_T.CADM = QL65000V_T.KODE RIGHT OUTER JOIN
				QL61000V_T ON JY67500V_T.CARTK = QL61000V_T.KODE ON QL61500V_T.KODE = JY67500V_T.CBENYT) AS Ejertabel
	RIGHT OUTER JOIN MAT_Aktiv_SamletFastEjendom ON Ejertabel.BFE_NUMMER = MAT_Aktiv_SamletFastEjendom.BFEnr,

(	SELECT  ESR.KOMMUNENUMMER AS EKOMNR, ESR.EJENDOMSNR AS EEJDNR, 0 AS DDATO, ISNULL(ADR.ANAVN, '') AS ANAVN, ISNULL(ADR.ACONAVN, '') AS ACONAVN, ISNULL(ADR.AADRESS, '') AS AADRESS, ISNULL(ADR.AUDVADR, '') AS AUDVADR, ISNULL(ADR.APOST, '') AS APOST, EJE.CMSTAT, EJE.CEJFORH, EJE.CPENS, EJE.CLEJE, EJE.GEJTAEL, EJE.GEJNAEV, EJE.GKOETAEL, EJE.GKOENAEV,
           ISNULL(ADR.CBSKADR, ' ') AS CBSKADR, CASE WHEN EJE.DSLUTS < '1753-01-01' THEN CONVERT(datetime, '1753-01-01', 120) ELSE CONVERT(datetime, EJE.DSLUTS, 120) END AS DSLUTS, CASE WHEN EJE.DSKOED < '1753-01-01' THEN CONVERT(datetime, '1753-01-01', 120) ELSE CONVERT(datetime, EJE.DSKOED, 120) END AS DSKOED,
           CASE WHEN EJE.DOVTG < '1753-01-01' THEN CONVERT(datetime, '1753-01-01', 120) ELSE CONVERT(datetime, EJE.DOVTG, 120) END AS DOVTG, EJE.COVMD, CASE WHEN EJE.DAFSTAA < '1753-01-01' THEN CONVERT(datetime, '1753-01-01', 120) ELSE CONVERT(datetime, EJE.DAFSTAA, 120) END AS DAFSTAA, EJE.BKOEBS, EJE.BLOESOE, EJE.BUDBT, EJE.GUDBT, EJE.CALTADR, EJE.DCPRCIR,
           CASE WHEN LEN(EJE.DCPRCIR) <= 8 THEN CONVERT(varchar(10), (EJE.DCPRCIR)) ELSE substring(CONVERT(varchar(11), (EJE.DCPRCIR + 10000000000)), 2, 10) END AS DCPCIR_REDIGERET, cast(ROW_NUMBER() OVER (ORDER BY
               (SELECT  '')) AS int) AS MI_PRINX
FROM    dbo.JN60500T AS ESR INNER JOIN
           dbo.JN61000T AS EJE ON ESR.ESREJENDOM_ID = EJE.FK_ESREJENDOM_ID AND EJE.TID_UD > CONVERT([char](26), GETDATE(), 121) LEFT OUTER JOIN
           dbo.JN61100T AS ADR ON EJE.FK_ESREJENDOM_ID = ADR.FK_ESREJENDOM_ID AND ADR.FK_TID_UD > CONVERT([char](26), GETDATE(), 121) AND ADR.FK_TID_UD = EJE.TID_UD AND ADR.FK_DCPRCIR = EJE.DCPRCIR
WHERE  (ESR.ESREJENDOM_ID > 0) AND (EJE.TID_UD >= CONVERT([char](26), GETDATE(), 121))) AS JY64900V