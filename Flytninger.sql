select * from (Select
BYG.KomKode as Kommunenummer
,Case when EJE1.ESREjdNr is not null then EJE1.ESREjdNr
              when EJE2.ESREjdNr is not null then EJE2.ESREjdNr
              when EJE3.ESREjdNr is not null then EJE3.ESREjdNr
              Else GRN.ESREjdNr
              end as Ejendomsnummer
,isnull(Q1.AntalFraflytninger_1Aar,0) as AntalFraflytninger_1Aar
,isnull(Q2.AntalFraflytninger_5Aar,0) as AntalFraflytninger_5Aar
,isnull(Q3.AntalFraflytninger_10Aar,0) as AntalFraflytninger_10Aar
,Case when B.PERSONNUMMER is null then 'Nej'
else 'Ja'
end as Beboet
,ENH.ENH_ANVEND_KODE as Anvendelseskode
,AKODE.TEKST as Anvendelse
,ENH.TOILET_KODE as ToiletForholdKode
,TKODE.TEKST as ToiletForhold
,ENH.AntVandskylToilleter as AntalVandskyllendeToilleter
,ENH.BAD_KODE as BadForholdKode
,BADKODE.TEKST as BadForhold
,ENH.AntBadevaerelser as AntalBadevaerelse
,ENH.ENH_UDLEJ2_KODE as UdlejningsForholdKode
,UFKODE.TEKST as UdlejningsForhold
,ENH.GodkTomBolig as GodkendtTomBoligKode
,GTBKODE.TEKST as GodkendtTomBolig
,case when ENH.VARMEINSTAL_KODE <> '' then convert(varchar,ENH.VarmeInstal_Kode)
when BYG.VarmeInstal_Kode <> '' then convert(varchar,BYG.VarmeInstal_Kode)
else '' end as VarmeInstal_Kode
,case when ENH.VARMEINSTAL_KODE <> '' then VIKODE.TEKST
when BYG.VarmeInstal_Kode <> '' then VIKODE2.TEKST
else '' end as VarmeInstallation
,case when ENH.Opvarmning_Kode <> '' then convert(varchar,ENH.Opvarmning_Kode)
when BYG.Opvarmning_Kode <> '' then convert(varchar,BYG.Opvarmning_Kode)
else '' end as Opvarmning_Kode
,case when ENH.Opvarmning_Kode <> '' then OVKODE.TEKST
when BYG.Opvarmning_Kode <> '' then OVKODE2.TEKST
else '' end as OpvarmningsMiddel
,case when ENH.Varme_Suppl_Kode <> '' then convert(varchar,ENH.Varme_Suppl_Kode)
when BYG.Varme_Suppl_Kode <> '' then convert(varchar,BYG.Varme_Suppl_Kode)
else '' end as Varme_Suppl_Kode
,case when ENH.Varme_Suppl_Kode <> '' then VSKODE.TEKST
when BYG.Varme_Suppl_Kode <> '' then VSKODE2.TEKST
else '' end as Varme_Supplerende
,case When ADG.Vej_Navn is null then ''
            When isnumeric(right(ADG.HUS_NR,1)) = 0 and (EAD.Etagebetegn is null or EAD.Etagebetegn = '') and (EAD.Side_DoerNr is null or EAD.Side_DoerNr = '')
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) + rtrim(Right(Adg.HUS_NR,1))
            When isnumeric(right(ADG.HUS_NR,1)) = 1 and (EAD.Etagebetegn is null or EAD.Etagebetegn = '') and (EAD.Side_DoerNr is null or EAD.Side_DoerNr = '')
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
             When isnumeric(right(ADG.HUS_NR,1)) = 0 and isnumeric(EAD.Etagebetegn) = 0 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and (EAD.Side_DoerNr is null or EAD.Side_DoerNr = '')
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) + rtrim(Right(Adg.HUS_NR,1)) 
                                                  + ', ' + lower(EAD.Etagebetegn)
            When isnumeric(right(ADG.HUS_NR,1)) = 0 and isnumeric(EAD.Etagebetegn) = 1 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and (EAD.Side_DoerNr is null or EAD.Side_DoerNr = '')
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) + rtrim(Right(Adg.HUS_NR,1)) 
                                                  + ', ' + convert(varchar,convert(int,EAD.Etagebetegn)) + '.'
            When isnumeric(right(ADG.HUS_NR,1)) = 1 and isnumeric(EAD.Etagebetegn) = 0 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and (EAD.Side_DoerNr is null or EAD.Side_DoerNr = '')
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + ', ' + lower(EAD.Etagebetegn)
            When isnumeric(right(ADG.HUS_NR,1)) = 1 and isnumeric(EAD.Etagebetegn) = 1 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and (EAD.Side_DoerNr is null or EAD.Side_DoerNr = '')
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + ', ' + convert(varchar,convert(int,EAD.Etagebetegn)) + '.'
            When isnumeric(right(ADG.HUS_NR,1)) = 0 and (EAD.Etagebetegn is null or EAD.Etagebetegn = '') and isnumeric(EAD.Side_DoerNr+ 'e0') = 1 and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) + rtrim(Right(Adg.HUS_NR,1))           
                                                  + ', nr.' + convert(varchar,convert(int,EAD.Side_DoerNr))
            When isnumeric(right(ADG.HUS_NR,1)) = 0 and (EAD.Etagebetegn is null or EAD.Etagebetegn = '') and isnumeric(EAD.Side_DoerNr+ 'e0') = 0 and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) + rtrim(Right(Adg.HUS_NR,1))           
                                                  + ', ' + lower(EAD.Side_DoerNr)
            When isnumeric(right(ADG.HUS_NR,1)) = 1 and (EAD.Etagebetegn is null or EAD.Etagebetegn = '') and isnumeric(EAD.Side_DoerNr+ 'e0') = 1 and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + ', nr.' + convert(varchar,convert(int,EAD.Side_DoerNr))
            When isnumeric(right(ADG.HUS_NR,1)) = 1 and (EAD.Etagebetegn is null or EAD.Etagebetegn = '') and isnumeric(EAD.Side_DoerNr+ 'e0') = 0 and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + ', ' + lower(EAD.Side_DoerNr)
            When isnumeric(right(ADG.HUS_NR,1)) = 1 and isnumeric(EAD.Side_DoerNr+ 'e0') = 1 and isnumeric(EAD.Etagebetegn) = 1 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + ', ' + convert(varchar,convert(int,EAD.Etagebetegn)) + '. nr.' + convert(varchar,convert(int,EAD.Side_DoerNr))
            When isnumeric(right(ADG.HUS_NR,1)) = 0 and isnumeric(EAD.Side_DoerNr+ 'e0') = 1 and isnumeric(EAD.Etagebetegn) = 1 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + lower(rtrim(Right(Adg.HUS_NR,1))) + ', ' + convert(varchar,convert(int,EAD.Etagebetegn)) + '. nr.' + convert(varchar,convert(int,EAD.Side_DoerNr))
            When isnumeric(right(ADG.HUS_NR,1)) = 1 and isnumeric(EAD.Side_DoerNr+ 'e0') = 0 and isnumeric(EAD.Etagebetegn) = 1 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + ', ' + convert(varchar,convert(int,EAD.Etagebetegn)) + '. ' + rtrim(lower(EAD.Side_DoerNr))
            When isnumeric(right(ADG.HUS_NR,1)) = 0 and isnumeric(EAD.Side_DoerNr+ 'e0') = 0 and isnumeric(EAD.Etagebetegn) = 1 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + lower(rtrim(Right(Adg.HUS_NR,1))) + ', ' + convert(varchar,convert(int,EAD.Etagebetegn)) + '. ' + rtrim(lower(EAD.Side_DoerNr))
            When isnumeric(right(ADG.HUS_NR,1)) = 1 and isnumeric(EAD.Side_DoerNr+ 'e0') = 1 and isnumeric(EAD.Etagebetegn) = 0 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + ', ' + lower(EAD.Etagebetegn) + ' nr.' + convert(varchar,convert(int,EAD.Side_DoerNr))
            When isnumeric(right(ADG.HUS_NR,1)) = 0 and isnumeric(EAD.Side_DoerNr+ 'e0') = 1 and isnumeric(EAD.Etagebetegn) = 0 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + lower(rtrim(Right(Adg.HUS_NR,1))) + ', ' + lower(EAD.Etagebetegn) + ' nr.' + convert(varchar,convert(int,EAD.Side_DoerNr))
            When isnumeric(right(ADG.HUS_NR,1)) = 1 and isnumeric(EAD.Side_DoerNr+ 'e0') = 0 and isnumeric(EAD.Etagebetegn) = 0 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + ', ' + lower(EAD.Etagebetegn) + ' ' + lower(rtrim(EAD.Side_DoerNr))
            When isnumeric(right(ADG.HUS_NR,1)) = 0 and isnumeric(EAD.Side_DoerNr+ 'e0') = 0 and isnumeric(EAD.Etagebetegn) = 0 and EAD.Etagebetegn is not null and EAD.Etagebetegn <> '' and EAD.Side_DoerNr is not null and EAD.Side_DoerNr <> ''
                         then ADG.Vej_Navn + ' ' + convert(varchar,convert(int,left(adg.HUS_NR,3))) 
                                                  + lower(rtrim(Right(Adg.HUS_NR,1))) + ', ' + lower(EAD.Etagebetegn) + ' ' + lower(rtrim(EAD.Side_DoerNr))
            else ''     
            end as Adresse
,ADG.SupBynavn as Bynavn
,convert(varchar,ADG.PostNr) + ' ' + ADG.PostByNavn as PostNummer_Distrikt
,ADG.VejKode
,ADG.HUS_NR
,EAD.Etagebetegn as Etage
,EAD.SIDE_DOERNR as Side_DoerNr
,isnull(Right('000' + convert(varchar,adg.KomKode),3) + Right('0000' + convert(varchar,ADG.VejKode),4) + ADG.HUS_NR,'') as KVH_ADR_KEY
,isnull(Right('000' + convert(varchar,adg.Komkode),3) + Right('0000' + convert(varchar,ADG.VejKode),4) + rtrim(ADG.HUS_NR)
                         + right('00' + isnull(rtrim(EAD.Etagebetegn),''),2) + right('0000' + isnull(rtrim(EAD.Side_DoerNr),''),4)
                                     ,'') as KVHX_ADR_KEY
,case when ESR1.Navn is not null then ESR1.NAvn
            when ESR2.Navn is not null then ESR2.NAvn
            when ESR3.Navn is not null then ESR3.NAvn
            else ''
            end as EjersNavn
,case when ESR1.PersonNr_CVRnr is not null then ESR1.PersonNr_CVRnr
            when ESR2.PersonNr_CVRnr is not null then ESR2.PersonNr_CVRnr
            when ESR3.PersonNr_CVRnr is not null then ESR3.PersonNr_CVRnr
            else 0
            end as PersonNr_CVRnr
,case when ESR1.Adresse_Ejer is not null then ESR1.Adresse_Ejer
            when ESR2.Adresse_Ejer is not null then ESR2.Adresse_Ejer
            when ESR3.Adresse_Ejer is not null then ESR3.Adresse_Ejer
            else ''
            end as Adresse_Ejer
,case when ESR1.UdvidetAdresse is not null then ESR1.UdvidetAdresse
            when ESR2.UdvidetAdresse is not null then ESR2.UdvidetAdresse
            when ESR3.UdvidetAdresse is not null then ESR3.UdvidetAdresse
            else ''
            end as Bynavn_Ejer
,case when ESR1.PostNummer_Distrikt is not null then ESR1.PostNummer_Distrikt
            when ESR2.PostNummer_Distrikt is not null then ESR2.PostNummer_Distrikt
            when ESR3.PostNummer_Distrikt is not null then ESR3.PostNummer_Distrikt
            else ''
            end as PostNummer_Distrikt_Ejer
,case when ESR1.AntalEjere is not null then ESR1.AntalEjere
            when ESR2.AntalEjere is not null then ESR2.AntalEjere
            when ESR3.AntalEjere is not null then ESR3.AntalEjere
            else 0
            end as AntalEjere
,case when ESR1.EjerforholdKode is not null then ESR1.EjerforholdKode
            when ESR2.EjerforholdKode is not null then ESR2.EjerforholdKode
            when ESR3.EjerforholdKode is not null then ESR3.EjerforholdKode
            else ''
            end as EjerforholdKode
,case when ESR1.EjerforholdType is not null then ESR1.EjerforholdType
            when ESR2.EjerforholdType is not null then ESR2.EjerforholdType
            when ESR3.EjerforholdType is not null then ESR3.EjerforholdType
            else ''
            end as EjerforholdType
,case when ESR1.OvertagelseDato is not null then ESR1.OvertagelseDato
            when ESR2.OvertagelseDato is not null then ESR2.OvertagelseDato
            when ESR3.OvertagelseDato is not null then ESR3.OvertagelseDato
            else '0001-01-01'
            end as OvertagelseDato
,APU.KoorOest
,APU.KoorNord
,APU.GEOMETRI

from CO40400T as ENH
inner join CO40200T as OPG on
          OPG.Opgang_id = ENH.Opgang_id
              and OPG.ObjStatus = 1
              and (OPG.Ophoert_Ts = '1753-01-01 00:00:00.000' or 
                            OPG.Ophoert_ts = '' or OPG.Ophoert_Ts > GetDate())
    inner join CO40100T as BYG on
          BYG.Bygning_id = OPG.Bygning_id
              and BYG.ObjStatus = 1
              and (BYG.Ophoert_Ts = '1753-01-01 00:00:00.000' or 
                            BYG.Ophoert_ts = '' or BYG.Ophoert_Ts > GetDate())
    inner join CO40000T as GRN on
          GRN.grund_id = BYG.grund_id
              and GRN.ObjStatus = 1 
              and (GRN.Ophoert_Ts = '1753-01-01 00:00:00.000' or 
                            GRN.Ophoert_ts = '' or GRN.Ophoert_Ts > GetDate())
            INNER JOIN CO42100T AS EAD on
                           EAD.EnhAdr_id = ENH.EnhAdr_id
              and EAD.ObjStatus = 1
              and (EAD.Ophoert_Ts = '1753-01-01 00:00:00.000' or 
                            EAD.Ophoert_ts = '' or EAD.Ophoert_Ts > GetDate())
            INNER JOIN CO42000T AS ADG on
                           ADG.AdgAdr_id = EAD.AdgAdr_id 
              and ADG.ObjStatus = 1
              and (ADG.Ophoert_Ts = '1753-01-01 00:00:00.000' or 
                            ADG.Ophoert_ts = '' or ADG.Ophoert_Ts > GetDate())
            left join LAND_ADRESSEPUNKT as APU on
                         APU.APU_ID = ADG.Adressepunkt_id
left join CO41000T as EJE1 on
EJE1.BbrId = ENH.Enhed_id 
and EJE1.ObjStatus = 1
              and (EJE1.Ophoert_Ts = '1753-01-01 00:00:00.000' or 
                            EJE1.Ophoert_ts = '' or EJE1.Ophoert_Ts > GetDate())
left join CO41000T as EJE2 on
EJE2.BbrId = BYG.Bygning_id 
and EJE2.ObjStatus = 1
              and (EJE2.Ophoert_Ts = '1753-01-01 00:00:00.000' or 
                            EJE2.Ophoert_ts = '' or EJE2.Ophoert_Ts > GetDate())
left join CO41000T as EJE3 on
EJE3.BbrId = GRN.Grund_id 
and EJE3.ObjStatus = 1
              and (EJE3.Ophoert_Ts = '1753-01-01 00:00:00.000' or 
                            EJE3.Ophoert_ts = '' or EJE3.Ophoert_Ts > GetDate())
LEFT JOIN ESR_EJER as ESR1 on
BYG.komkode = ESR1.KommuneNummer
and EJE1.ESREjdNr = ESR1.EjendomsNummer
and ESR1.EjerstatusKode = 0
LEFT JOIN ESR_EJER as ESR2 on
BYG.komkode = ESR2.KommuneNummer
and EJE2.ESREjdNr = ESR2.EjendomsNummer
and ESR2.EjerstatusKode = 0
LEFT JOIN ESR_EJER as ESR3 on
BYG.komkode = ESR3.KommuneNummer
and EJE3.ESREjdNr = ESR3.EjendomsNummer
and ESR3.EjerstatusKode = 0
            LEFT JOIN (select distinct convert(smallint,KODE_VAERDI) as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'ENH.45') as UFKODE on
                         UFKODE.KODE = ENH.ENH_UDLEJ2_KODE
            LEFT JOIN (select distinct convert(smallint,KODE_VAERDI) as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'ENH.48') as GTBKODE on
                         GTBKODE.KODE = ENH.GodkTomBolig
            LEFT JOIN (select distinct convert(smallint,KODE_VAERDI) as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'ENH.51') as VIKODE on
                         VIKODE.KODE = ENH.VARMEINSTAL_KODE
            LEFT JOIN (select distinct convert(smallint,KODE_VAERDI) as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'ENH.52') as OVKODE on
                         OVKODE.KODE = ENH.OPVARMNING_KODE
            LEFT JOIN (select distinct convert(smallint,KODE_VAERDI) as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'ENH.53') as VSKODE on
                         VSKODE.KODE = ENH.VARME_SUPPL_KODE
            LEFT JOIN (select distinct KODE_VAERDI as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'ENH.32') as TKODE on
                         TKODE.KODE = ENH.TOILET_KODE
            LEFT JOIN (select distinct KODE_VAERDI as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'ENH.33') as BADKODE on
                         BADKODE.KODE = ENH.BAD_KODE
            Left join (select distinct convert(smallint,KODE_VAERDI) as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'ENH.20') as AKODE on
                         AKODE.KODE = ENH.ENH_ANVEND_KODE

            LEFT JOIN (select distinct convert(smallint,KODE_VAERDI) as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'BYG.56') as VIKODE2 on
                         VIKODE2.KODE = BYG.VARMEINSTAL_KODE
            LEFT JOIN (select distinct convert(smallint,KODE_VAERDI) as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'BYG.57') as OVKODE2 on
                         OVKODE2.KODE = BYG.OPVARMNING_KODE
            LEFT JOIN (select distinct convert(smallint,KODE_VAERDI) as KODE,KODE_TEKST as TEKST 
                                                  from CO42900T as KFE inner join CO42600T as FEL on FEL.FELT_ID = KFE.FELT_ID
                                                  inner join CO43000T as KOD on KOD.KODEFELT_ID = KFE.KODEFELT_ID
                                                  where BBRNR = 'BYG.58') as VSKODE2 on
                         VSKODE2.KODE = BYG.VARME_SUPPL_KODE
left join (Select
count(*) as AntalFraflytninger_1Aar, KOMMUNENUMMER, VEJKODE, HUS_NR, ETAGE, SIDE_DORNR
from GEO_BORGER_BOSAETTELSE
where KOMMUNENUMMER = 791
and ADR_FRAFLYT_TS < getdate()
and convert(date,ADR_FRAFLYT_TS) > convert(date,dateadd(YEAR,-1,getdate()))
group by KOMMUNENUMMER, VEJKODE, HUS_NR, ETAGE, SIDE_DORNR) as Q1 on
Q1.KOMMUNENUMMER = ADG.komkode
and Q1.VEJKODE = ADG.VejKode
and Q1.HUS_NR = ADG.HUS_NR
and Q1.ETAGE = EAD.Etagebetegn
and Q1.SIDE_DORNR = EAD.SIDE_DOERNR
left join (Select
count(*) as AntalFraflytninger_5Aar, KOMMUNENUMMER, VEJKODE, HUS_NR, ETAGE, SIDE_DORNR
from GEO_BORGER_BOSAETTELSE
where KOMMUNENUMMER = 791
and ADR_FRAFLYT_TS < getdate()
and convert(date,ADR_FRAFLYT_TS) > convert(date,dateadd(YEAR,-5,getdate()))
group by KOMMUNENUMMER, VEJKODE, HUS_NR, ETAGE, SIDE_DORNR) as Q2 on
Q2.KOMMUNENUMMER = ADG.komkode
and Q2.VEJKODE = ADG.VejKode
and Q2.HUS_NR = ADG.HUS_NR
and Q2.ETAGE = EAD.Etagebetegn
and Q2.SIDE_DORNR = EAD.SIDE_DOERNR
left join (Select
count(*) as AntalFraflytninger_10Aar, KOMMUNENUMMER, VEJKODE, HUS_NR, ETAGE, SIDE_DORNR
from GEO_BORGER_BOSAETTELSE
where KOMMUNENUMMER = 791
and ADR_FRAFLYT_TS < getdate()
and convert(date,ADR_FRAFLYT_TS) > convert(date,dateadd(YEAR,-10,getdate()))
group by KOMMUNENUMMER, VEJKODE, HUS_NR, ETAGE, SIDE_DORNR) as Q3 on
Q3.KOMMUNENUMMER = ADG.komkode
and Q3.VEJKODE = ADG.VejKode
and Q3.HUS_NR = ADG.HUS_NR
and Q3.ETAGE = EAD.Etagebetegn
and Q3.SIDE_DORNR = EAD.SIDE_DOERNR
left join GEO_BORGER_AKTIV as B on
B.KOMMUNENUMMER = ADG.komkode
and B.VEJKODE = ADG.VejKode
and B.HUS_NR = ADG.HUS_NR
and B.ETAGE = EAD.Etagebetegn
and B.SIDE_DORNR = EAD.SIDE_DOERNR
Where ENH.ObjStatus = 1
and ENH.NyByg = 0
and ENH.ENH_UDLEJ2_KODE = 1 
and enh.ENH_ANVEND_KODE < 200
and (ENH.Ophoert_Ts = '1753-01-01 00:00:00.000' or 
               ENH.Ophoert_ts = '' or ENH.Ophoert_Ts > GetDate())

) as T

where 1=1 
