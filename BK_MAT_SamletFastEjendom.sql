SELECT
				SFEnr,
				BFEnr,
				Arbejderbolig,
				Faelleslod,
				SFEOpdeltIEjerlejligh,
				Landbrugsnotering,
				UdskiltVej,
				KommuneNr,
				SenesteSagID,
				geometri,
				SFEObjectID AS MI_PRINX,
				CAST('Pen (1, 2, 0) Brush (1, 0, 16777215) Symbol (49,0,12)' AS char(150)) AS MI_STYLE
FROM
				MAT_Aktiv_SamletFastEjendom