USE BD_VENTA
SELECT * FROM CATEGORIA

SELECT	c.idCategoria 
		,c.descripcion AS nombreCategoria
		,c.estado
FROM	Categoria AS c

SELECT	c.idCategoria 
		,c.descripcion
		,c.estado
FROM	Categoria AS c
WHERE	idCategoria = 3

SELECT	p.idProducto
		,p.descripcion
		,p.estado
FROM	Producto AS p
WHERE	p.descripcion LIKE '%to%'

SELECT	p.idProducto
		,p.descripcion
		,p.estado
FROM	Producto AS p
WHERE	p.descripcion LIKE 'z%'

SELECT	p.idProducto
		,p.descripcion
		,p.estado
FROM	Producto AS p
WHERE	p.descripcion LIKE '%m'

SELECT	p.idProducto
		,p.descripcion
		,p.estado
FROM	Producto AS p
WHERE	p.descripcion LIKE '_a%'

UPDATE Producto SET estado = 'I' WHERE idProducto = 2
UPDATE Producto SET estado = 'I' WHERE idProducto = 4
UPDATE Producto SET estado = 'I' WHERE idProducto = 11

SELECT	p.idProducto
		,p.descripcion
		,p.stock
		,p.estado
FROM	Producto AS p
WHERE	p.descripcion LIKE '[a-t]%'
		AND p.estado = 'A'
		AND p.stock > 20


SELECT	p.idcategoria
		,estado
		,COUNT(p.idProducto) AS [total Productos]
FROM	Producto AS p
GROUP BY p.idcategoria
		,p.estado
HAVING	 COUNT(p.idProducto) > 1
ORDER BY p.idcategoria



SELECT * FROM Producto WHERE idCategoria IN (1, 2, 3);

SELECT * FROM Producto
WHERE idProducto IN (SELECT idProducto FROM DetalleVenta WHERE estado = 'A');

SELECT * FROM Producto p
WHERE EXISTS (
    SELECT 1 FROM DetalleVenta dv
    WHERE p.idProducto = dv.idProducto AND dv.Estado = 'A');

SELECT  c.idCategoria
		,c.descripcion
		,p.idProducto
		,p.descripcion
		,p.idCategoria
		,p.estado
FROM	Categoria AS c
		INNER JOIN Producto AS p ON c.idCategoria = p.idCategoria
WHERE	 p.estado = 'A'

SELECT  *
FROM	Producto AS p 
		INNER JOIN Categoria AS c ON p.idCategoria = c.idCategoria

SELECT * 
FROM	Cliente AS cli
		INNER JOIN Venta AS v ON cli.idCliente = v.idCliente


SELECT *
FROM	DetalleVenta			AS dv
		INNER JOIN Producto		AS p	WITH(NOLOCK)ON p.idProducto = dv.idProducto
		INNER JOIN Venta		AS v	WITH(NOLOCK)ON v.idVenta	= dv.idVenta
		INNER JOIN Categoria	AS c	WITH(NOLOCK)ON c.idCategoria= p.idCategoria
		INNER JOIN Cliente		AS cli	WITH(NOLOCK)ON cli.idCliente= v.idCliente
