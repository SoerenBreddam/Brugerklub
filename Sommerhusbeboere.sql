Select T.*, APU.GEOMETRI from(
Select distinct
A.Personnummer,
A.Navn,
A.Alder,
A.CIVILSTAND_TXT as Civilstand,
A.Adresse_Off as Adresse,
A.ADR_TILFLYT_TS as AdresseTilflytningsTidspunkt,
Case when A.PERSONNUMMER in (Select E1.PersonNr_CVRnr from ESR_EJER as E1 Where BYG.KommuneNummer = E1.KommuneNummer and E1.EjendomsNummer = BYG.EjendomsNummer) then  'Ejer'
            when A.PERSONNR_AGTEFALLE in (Select E2.PersonNr_CVRnr from ESR_EJER as E2 Where BYG.KommuneNummer = E2.KommuneNummer and E2.EjendomsNummer = BYG.EjendomsNummer) then  'Ejet af Ægtefælle'
            when (Select count(*) from ESR_EJER as E6 Where BYG.KommuneNummer = E6.KommuneNummer and E6.EjendomsNummer = BYG.EjendomsNummer) > 1 
                         then 'Ejet af andre personer (2+) - ' + (Select rtrim(E7.Navn) from ESR_EJER as E7 Where BYG.KommuneNummer = E7.KommuneNummer and E7.EjendomsNummer = BYG.EjendomsNummer and E7.EjerstatusKode = 0 ) + '+...'
            when (Select top 1 E5.PersonNr_CVRnr from ESR_EJER as E5 Where BYG.KommuneNummer = E5.KommuneNummer and E5.EjendomsNummer = BYG.EjendomsNummer) in 
                                     (Select b.PERSONNUMMER from GEO_BORGER_AKTIV as B where A.KVH_ADR_KEY = B.KVH_ADR_KEY) then 'Ejet af anden person på adressen'
            when (Select count(*) from ESR_EJER as E3 Where BYG.KommuneNummer = E3.KommuneNummer and E3.EjendomsNummer = BYG.EjendomsNummer) = 1 
                         then 'Ejet af ' + (Select rtrim(E4.Navn) from ESR_EJER as E4 Where BYG.KommuneNummer = E4.KommuneNummer and E4.EjendomsNummer = BYG.EjendomsNummer)
            else 'Ukendt'
            end as Ejer_BeboerForhold,
isnull((Select E8.Pensionist from ESR_EJER as E8 where BYG.KommuneNummer = E8.KommuneNummer and E8.EjendomsNummer = BYG.EjendomsNummer and E8.PersonNr_CVRnr = A.PERSONNUMMER),'') as PensionistStatusbeboer,
A.PERSONNR_AGTEFALLE as PersonnummerAegtefaelle,
BYG.BygAnvendelseKode,
Byg.BygAnvendelseTekst,
BYG.KommuneNummer,
BYG.EjendomsNummer,
BYG.GEO_Ejendom,
A.Vejkode,
convert(varchar,A.HusNummer) + A.HusBogstav as Husnummer,
A.KVH_ADR_KEY
from GEO_BBR_Bygning as BYG
inner join GEO_BORGER_AKTIV as A on BYG.KVH_ADR_KEY = A.KVH_ADR_KEY
Where BYG.BygAnvendelseKode = 510 
) as T
left join LAND_ADRESSEPUNKT as APU on APU.KVH_ADR_KEY = T.KVH_ADR_KEY
where 1=1
