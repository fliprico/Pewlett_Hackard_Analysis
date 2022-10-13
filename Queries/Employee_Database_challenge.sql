SELECT e.emp_no,
	   e.first_name,
	e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
	INTO retirement_titles
	FROM employees as e
	LEFT JOIN titles as ti
	ON e.emp_no = ti.emp_no
	
SELECT * FROM retirement_titles;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_emp_titles 
FROM retirement_titles as rt 
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_emp_titles;

SELECT COUNT (uet.emp_no), uet.title
INTO retiring_titles
FROM unique_emp_titles as uet
GROUP BY uet.title
ORDER BY uet.count DESC;

SELECT * FROM retiring_titles;

ELECT DISTINCT ON (e.emp_no) e.emp_no,
	    e.first_name,
	    e.last_name,
	e.birth_date,
		de.from_date,
	de.to_date,
		t.title	
INTO mentorship_eligibilty
FROM employees as e 

INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
	
INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
	
WHERE t.to_date = ('9999-01-01')
	AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'

ORDER BY e.emp_no;