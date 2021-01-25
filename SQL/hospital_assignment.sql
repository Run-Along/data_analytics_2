SELECT *
FROM nurse
WHERE registered='false';

SELECT name AS "Name",
       POSITION AS "Position"
FROM nurse
WHERE POSITION='Head Nurse';

SELECT d.name AS "Department",
       p.name AS "Physician"
FROM department d,
     physician p
WHERE d.head=p.employeeid;

SELECT count(DISTINCT patient) AS "No. of patients taken at least one appointment"
FROM appointment;

SELECT blockfloor AS "Floor",
       blockcode AS "Block"
FROM room
WHERE roomnumber=212;

SELECT count(*) "Number of available rooms"
FROM room
WHERE unavailable='false';

SELECT count(*) "Number of available rooms"
FROM room
WHERE unavailable='true';

SELECT p.name AS "Physician",
       d.name AS "Department"
FROM physician p,
     department d,
     affiliated_with a
WHERE p.employeeid=a.physician
  AND a.department=d.departmentid;
  
  SELECT p.name AS "Physician",
       c.name AS "Treatement"
FROM physician p,
     PROCEDURE c,
               trained_in t
WHERE t.physician=p.employeeid
  AND t.treatment=c.code;
  
  SELECT p.name AS "Physician",
       p.position,
       d.name AS "Department"
FROM physician p
JOIN affiliated_with a ON a.physician=p.employeeid
JOIN department d ON a.department=d.departmentid
WHERE primaryaffiliation='false';

SELECT p.name AS "Physician",
       p.position "Designation"
FROM physician p
LEFT JOIN trained_in t ON p.employeeid=t.physician
WHERE t.treatment IS NULL
ORDER BY employeeid;

SELECT t.name AS "Patient",
       t.address AS "Address",
       p.name AS "Physician"
FROM patient t
JOIN physician p ON t.pcp=p.employeeid;


SELECT p.name "Patient",
       count(t.patient) "Appointment for No. of Physicians"
FROM appointment t
JOIN patient p ON t.patient=p.ssn
GROUP BY p.name
HAVING count(t.patient)>=1;

SELECT count(DISTINCT patient) AS "No. of patients got appointment for room C"
FROM appointment
WHERE examinationroom='C';

SELECT t.name AS "Name of the patient",
       p.name AS "Name of the physician",
       a.examinationroom AS "Room No."
FROM patient t
JOIN appointment a ON a.patient=t.ssn
JOIN physician p ON a.physician=p.employeeid
WHERE a.prepnurse IS NULL;

SELECT t.name AS "Patient",
       p.name AS "Physician",
       m.name AS "Medication"
FROM patient t
JOIN prescribes s ON s.patient=t.ssn
JOIN physician p ON s.physician=p.employeeid
JOIN medication m ON s.medication=m.code;

SELECT t.name AS "Patient",
       p.name AS "Physician",
       m.name AS "Medication"
FROM patient t
JOIN prescribes s ON s.patient=t.ssn
JOIN physician p ON s.physician=p.employeeid
JOIN medication m ON s.medication=m.code
WHERE s.appointment IS NOT NULL;

SELECT t.name AS "Patient",
       p.name AS "Physician",
       m.name AS "Medication"
FROM patient t
JOIN prescribes s ON s.patient=t.ssn
JOIN physician p ON s.physician=p.employeeid
JOIN medication m ON s.medication=m.code
WHERE s.appointment IS NULL;

SELECT blockcode AS "Block",
       count(*) "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockcode
ORDER BY blockcode;

SELECT blockfloor AS "Floor",
       count(*) "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor
ORDER BY blockfloor;

SELECT blockfloor AS "Floor",
       count(*) "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor
ORDER BY blockfloor;

SELECT blockfloor AS "Floor",
       blockcode AS "Block",
       count(*) "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor,
        blockcode
ORDER BY blockfloor,
        blockcode;
		
SELECT blockfloor AS "Floor",
       blockcode AS "Block",
       count(*) "Number of available rooms"
FROM room
WHERE unavailable='true'
GROUP BY blockfloor,
        blockcode
ORDER BY blockfloor,
        blockcode;
		
SELECT blockfloor as "Floor",
       count(*) AS  "No of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor
HAVING count(*) =
  (SELECT max(zz) AS highest_total
   FROM
     ( SELECT blockfloor ,
              count(*) AS zz
      FROM room
      WHERE unavailable='false'
      GROUP BY blockfloor ) AS t );

SELECT blockfloor as "Floor",
       count(*) AS  "No of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor
HAVING count(*) =
  (SELECT min(zz) AS highest_total
   FROM
     ( SELECT blockfloor ,
              count(*) AS zz
      FROM room
      WHERE unavailable='false'
      GROUP BY blockfloor ) AS t );
	  
	  
SELECT p.name AS "Patient",
       s.room AS "Room",
       r.blockfloor AS "Floor",
       r.blockcode AS "Block"
FROM stay s
JOIN patient p ON s.patient=p.ssn
JOIN room r ON s.room=r.roomnumber;

SELECT n.name AS "Nurse",
       o.blockcode AS "Block"
FROM nurse n
JOIN on_call o ON o.nurse=n.employeeid;

SELECT n.name
FROM nurse n
WHERE employeeid IN
    ( SELECT oc.nurse
     FROM on_call oc,
          room r
     WHERE oc.blockfloor = r.blockfloor
       AND oc.blockcode = r.blockcode
       AND r.roomnumber = 122 );
	   
SELECT pt.name AS "Ptient",
       p.name AS "Physician"
FROM patient pt
JOIN prescribes pr ON pr.patient=pt.ssn
JOIN physician p ON pt.pcp=p.employeeid
WHERE pt.pcp=pr.physician
  AND pt.pcp=p.employeeid;

SELECT pt.name AS "Patient",
       p.name AS "Primary care Physician"
FROM patient pt
JOIN physician p ON pt.pcp=p.employeeid
WHERE pt.pcp NOT IN
    (SELECT head
     FROM department);