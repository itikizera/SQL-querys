SELECT * FROM  SRTBASE 
WHERE RT_MAT IN ('005193') 
ORDER BY 2, 4

SELECT * FROM  SRT990
WHERE RT_MAT IN ('002640','003136','005193','005339','005495')
AND RT_VERBA = '802'
ORDER BY 2, 4


UPDATE SRTBASE
SET RT_TIPPROV = '1'
WHERE RT_MAT  = '004570' AND RT_TIPPROV = '2'
--AND RT_FILIAL = '47'

UPDATE SRT990 
SET RT_TIPPROV = '1'
WHERE RT_MAT  = '005339' AND RT_TIPPROV = '2'

SELECT * FROM  SRTBASE 
WHERE RT_MAT IN ('003253')
ORDER BY 2, 5

UPDATE SRTBASE 
SET RT_TIPPROV = '2'
WHERE RT_MAT  = '003253' AND RT_TIPPROV = '1'

UPDATE SRT990
SET RT_TIPPROV = '2'
WHERE RT_MAT  = '003253' AND RT_TIPPROV = '1'

UPDATE SRT990 
SET RT_CC = '040101999'
WHERE RT_MAT ='003250' AND RT_CC = '000000000'

UPDATE SRT990
SET RT_DFERVEN = '30'
WHERE RT_MAT IN ('002640','003136','005193','005339','005495')
AND RT_VERBA = '802'

