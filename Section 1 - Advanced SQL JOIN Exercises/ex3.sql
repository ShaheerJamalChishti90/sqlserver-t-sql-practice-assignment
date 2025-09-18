--Exercise 3: Select All Main Categories and Their Subcategories

--Exercise:
--Select the name of the main categories 
--(which have a NULL in the parent_id column) 
--and the name of their direct subcategory (if one exists). 
--Name the first column category 
--and the second column subcategory.

SELECT 
    parent.name AS category,
    child.name AS subcategory
FROM 
    category parent
LEFT JOIN 
    category child ON child.parent_id = parent.id
WHERE 
    parent.parent_id IS NULL
ORDER BY 
    parent.name, child.name;