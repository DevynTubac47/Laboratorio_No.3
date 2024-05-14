drop database if exists dbKinalXpress;

create database dbKinalXpress;

use dbKinalXpress;

set global time_zone = '-6:00';

create table CargoEmpleado(
	codigoCargoEmpleado int not null auto_increment,
    nombreCargo varchar(45),
    descripcionCargo varchar(45),
    primary key PK_CargoEmpleado(codigoCargoEmpleado)
);

create table Clientes(
	clienteID int not null,
	nombresCliente varchar(50),
    apellidosCliente varchar(50),
    NITClientes varchar(10) not null,
    direccionCliente varchar(150),
    telefonoCliente varchar(8),
    correoCliente varchar(45),
    primary key PK_Clientes(clienteID)
);

create table Proveedores(
	codigoProveedor int not null,
    NITProvedor varchar(10) not null,
    nombresProveedor varchar(60),
    apellidosProveedor varchar(60),
    direccionProveedor varchar(150),
    razonSocial varchar(60),
    contactoPrincipal varchar(100),
    paginaWeb varchar(50),
    primary key PK_Proveedores(codigoProveedor)
);

create table Compras(
	numeroDocumento int not null,
    fechaDocumento date,
    descripcion varchar(60),
    totalDocumento decimal(10,2),
    primary key PK_Compras(numeroDocumento)
);

create table TipoProducto(
	codigoTipoProducto int,
    descripcion varchar(45),
    primary key PK_TipoProducto(codigoTipoProducto)
);

create table Empleados(
	codigoEmpleado int not null,
    nombresEmpleado varchar(50),
    apellidosEmpleado varchar(50),
    sueldo decimal(10,2),
    direccion varchar(150),
    turno varchar(15),
    codigoCargoEmpleado int,
    primary key PK_Empleados(codigoEmpleado),
    constraint FK_Empleados_CargoEmpleado foreign key Empleados(codigoCargoEmpleado)
		references CargoEmpleado(codigoCargoEmpleado)
);

create table EmailProveedor(
	codigoEmailProveedor int not null,
    emailProveedor varchar(50),
    descripcion varchar(100),
    codigoProveedor int,
    primary key PK_EmailProveedor(codigoEmailProveedor),
    constraint FK_EmailProveedor_Proveedores foreign key EmailProveedor(codigoProveedor)
		references Proveedores(codigoProveedor)
);

create table TelefonoProveedor(
	codigoTelefonoProveedor int not null,
    numeroPrincipal varchar(8),
    numeroSecundario varchar(8),
    observaciones varchar(45),
    codigoProveedor int,
    primary key PK_TelefonoProveedor(codigoTelefonoProveedor),
    constraint FK_TelefonoProveedor_Proveedores foreign key TelefonoProveedor(codigoProveedor)
		references Proveedores(codigoProveedor)
);


delimiter $$
create procedure sp_agregarCargoEmpleado(in nombreCargo varchar(45), in descripcionCargo varchar(45))
begin
	insert into CargoEmpleado(nombreCargo,descripcionCargo)
    values(nombreCargo,descripcionCargo);
end $$
delimiter ;

call sp_agregarCargoEmpleado('Vendedor','Vender');
call sp_agregarCargoEmpleado('Cajero','Cobrar');

delimiter $$
create procedure sp_listarCargoEmpleado()
begin
	select * from CargoEmpleado;
end $$
delimiter ;

call sp_listarCargoEmpleado;

delimiter $$
create procedure sp_buscarCargoEmpleado(in codigoCargoEmpleado int)
begin
	select * from CargoEmpleado where codigoCargoEmpleado = codigoCargoEmpleado;
end $$
delimiter ;

call sp_buscarCargoEmpleado(1);

delimiter $$
create procedure sp_actualizarCargoEmpleado(in codigoCargoEmpleado int,in nombreCargo varchar(45), in descripcionCargo varchar(45))
begin
	update CargoEmpleado
    set
		CargoEmpleado.nombreCargo = nombreCargo,
        CargoEmpleado.descripcionCargo = descripcionCargo
	where
		CargoEmpleado.codigoCargoEmpleado = codigoCargoEmpleado;
end $$
delimiter ;

call sp_actualizarCargoEmpleado(1,'Colocadora','Ver productos');

delimiter $$
create procedure sp_eliminarCargoEmpleado(in codigoCargoEmpleado int)
begin
	delete from CargoEmpleado where CargoEmpleado.codigoCargoEmpleado = codigoCargoEmpleado;
end $$
delimiter ;

call sp_eliminarCargoEmpleado(1);

-- Clientes
 delimiter $$
 create procedure sp_agregarClientes(in clienteID int, in nombresCliente varchar(50), in apellidosCliente varchar(50), in NITClientes varchar(10),in direccionCliente varchar(150), in telefonoCliente varchar(8), in correoCliente varchar(45))
 begin
	insert into Clientes(clienteID, nombresCliente, apellidosCliente, NITClientes,direccionCliente, telefonoCliente, correoCliente)
    values (clienteID, nombresCliente, apellidosCliente, NITClientes,direccionCliente, telefonoCliente, correoCliente);
 end $$
 delimiter ;
 
 call sp_agregarClientes(1,'43bu53u121','Devyn','Gomez','12 Calle y 6 Avenida','3441421','dgomez');
 call sp_agregarClientes(2,'43bu53u121','Devyn','Gomez','12 Calle y 6 Avenida','3441421','dgomez');
 
delimiter $$
 create procedure sp_listarClientes()
 begin
	select * from Clientes;
 end $$
 delimiter ;
 
 call sp_listarClientes();
 
delimiter $$
create procedure sp_buscarClientes(in clienteID int)
 begin
	select * from Clientes where clienteID = clienteID;
 end $$
 delimiter ;
 
 call sp_buscarClientes(1);

delimiter $$
 create procedure sp_actualizarClientes(in clienteID int, in nombresCliente varchar(50), in apellidosCliente varchar(50),in NITClientes varchar(10), in direccionCliente varchar(150), telefonoCliente varchar(8), in correoCliente varchar(45))
 begin
	update Clientes
    set
        Clientes.nombresCliente = nombresCliente,
        Clientes.apellidosCliente = apellidosCliente,
        Clientes.NITClientes = NITClientes,
        Clientes.direccionCliente = direccionCliente,
        Clientes.telefonoCliente = telefonoCliente,
        Clientes.correoCliente = correoCliente
	where
		Clientes.clienteID = clienteID;
 end $$
 delimiter ;
 
 call sp_actualizarClientes(1,'5434534','Orlando','Gomez','11 Calle y 10 Avenida','12345678','ogomez');
 
delimiter $$
create procedure sp_eliminarClientes(in clienteID int)
begin
	delete from Clientes where Clientes.clienteID = clienteID;
end $$
delimiter ;

call sp_eliminarClientes(1);

delimiter $$
create procedure sp_agregarCompras(in numeroDocumento int, in fechaDocumento date, in descripcion varchar(60), in totalDocumento decimal(10,2))
begin
	insert into Compras(numeroDocumento, fechaDocumento, descripcion, totalDocumento)
    values(numeroDocumento, fechaDocumento, descripcion, totalDocumento);
end $$
delimiter ;

delimiter $$
create procedure sp_listarCompras()
begin
	select * from Compras;
end $$
delimiter ;

delimiter $$
create procedure sp_buscarCompras(in numeroDocumento int)
begin
	select * from Compras where numeroDocumento = numeroDocumento;
end $$
delimiter ;

delimiter $$
create procedure sp_actualizarCompras(in numeroDocumento int, in fechaDocumento date, in descripcion varchar(60), in totalDocumento decimal(10,2))
begin
	update Compras
    set
		fechaDocumento = fechaDocumento,
        descripcion = descripcion,
        totalDocumento = totalDocumento
	where
		numeroDocumento = numeroDocumento;
end $$
delimiter ;

delimiter $$
create procedure sp_eliminarCompras(in numeroDocumento int)
begin
	delete from Compras where numeroDocumento = numeroDocumento;
end $$
delimiter ;

delimiter $$
create procedure sp_agregarProveedores(in codigoProveedor int, in NITProvedor varchar(10), in nombresProveedor varchar(60), in apellidosProveedor varchar(60), in direccionProveedor varchar(150), in razonSocial varchar(60), in contactoPrincipal varchar(100), in paginaWeb varchar(50))
begin
	insert into Proveedores(codigoProveedor, NITProvedor, nombresProveedor, apellidosProveedor, direccionProveedor, razonSocial, contactoPrincipal, paginaWeb)
    values (codigoProveedor, NITProvedor, nombresProveedor, apellidosProveedor, direccionProveedor, razonSocial, contactoPrincipal, paginaWeb);
end $$
delimiter ;

call sp_agregarProveedores(1,'3254vb','Sarita','Heladeria','10 Calle y 8 Avenida','ABC','123456','www');
call sp_agregarProveedores(2,'3254vb','Sarita','Heladeria','10 Calle y 8 Avenida','ABC','123456','www');

delimiter $$
create procedure sp_listarProveedores()
begin
	select * from Proveedores;
end $$
delimiter ;

call sp_listarProveedores;

delimiter $$
create procedure sp_buscarProveedores(in codigoProveedor int)
begin
	select * from Proveedores where codigoProveedor = codigoProveedor;
end $$
delimiter ;

call sp_buscarProveedores(1);

delimiter $$
create procedure sp_actualizarProveedores(in codigoProveedor int, in NITProvedor varchar(10), in nombresProveedor varchar(60), in apellidosProveedor varchar(60), in direccionProveedor varchar(150), in razonSocial varchar(60), in contactoPrincipal varchar(100), in paginaWeb varchar(50))
begin
	update Proveedores
    set
		NITProvedor = NITProvedor,
        nombresProveedor = nombresProveedor,
        apellidosProveedor = apellidosProveedor,
        direccionProveedor = direccionProveedor,
        razonSocial = razonSocial,
        contactoPrincipal = contactoPrincipal,
        paginaWeb = paginaWeb
	where
		Proveedores.codigoProveedor = codigoProveedor;
end $$	
delimiter ;

call sp_actualizarProveedores(1,'12345','Pollo','Campero','11 Avenida','cba','654775','org');

delimiter $$
create procedure sp_eliminarProveedores(in codigoProveedor int)
begin
	delete from Proveedores where Proveedores.codigoProveedor = codigoProveedor;
end $$
delimiter ;

call sp_eliminarProveedores(1);

delimiter $$
create procedure sp_agregarTipoProducto(in codigoTipoProducto int, in descripcion varchar(45))
begin 
	insert into TipoProducto(codigoTipoProducto, descripcion)
    values(codigoTipoProducto, descripcion);
end $$
delimiter ;

call sp_agregarTipoProducto(1,'Sarita');

delimiter $$
create procedure sp_listarTipoProducto()
begin 
	select * from TipoProducto;
end $$
delimiter ;

call sp_listarTipoProducto;

delimiter $$
create procedure sp_buscarTipoProducto(in codigoTipoProducto int)
begin 
	select * from TipoProducto where codigoTipoProducto = codigoTipoProducto;
end $$
delimiter ;

call sp_buscarTipoProducto(1);

delimiter $$
create procedure sp_actualizarTipoProducto(in codigoTipoProducto int, in descripcion varchar(45))
begin 
	update TipoProducto
    set
		descripcion = descripcion
	where 
		TipoProducto.codigoTipoProducto = codigoTipoProducto;
end $$
delimiter ;

call sp_actualizarTipoProducto(1,'Pollo Frito');

delimiter $$
create procedure sp_eliminarTipoProducto(in codigoTipoProducto int)
begin 
	delete from TipoProducto where TipoProducto.codigoTipoProducto = codigoTipoProducto;
end $$
delimiter ;

call sp_eliminarTipoProducto(1);

delimiter $$
create procedure sp_agregarEmpleados(in codigoEmpleado int, in nombresEmpleado varchar(50), in apellidosEmpleado varchar(50), in sueldo decimal(10,2), in direccion varchar(150), in turno varchar(15), in codigoCargoEmpleado int)
begin 
	insert into Empleados(codigoEmpleado, nombresEmpleado, apellidosEmpleado, sueldo, direccion, turno, codigoCargoEmpleado)
    values (codigoEmpleado, nombresEmpleado, apellidosEmpleado, sueldo, direccion, turno, codigoCargoEmpleado);
end $$
delimiter ;

call sp_agregarEmpleados(1,'Pedro','Gomez','10.0','10 Calle y 10 Avenida','M',2);


delimiter $$
create procedure sp_listarEmpleados()
begin 
	select * from Empleados;
end $$
delimiter ;

call sp_listarEmpleados();

delimiter $$
create procedure sp_buscarEmpleados(in codigoEmpleado int)
begin 
	select * from Empleados where Empleados.codigoEmpleado = codigoEmpleado;
end $$
delimiter ;

call sp_buscarEmpleados(1);

delimiter $$
create procedure sp_actualizarEmpleados(in codigoEmpleado int, in nombresEmpleado varchar(50), in apellidosEmpleado varchar(50), in sueldo decimal(10,2), in direccion varchar(150), in turno varchar(15), in codigoCargoEmpleado int)
begin 
	update Empleados
    set	
		Empleados.nombresEmpleado = nombresEmpleado,
		Empleados.apellidosEmpleado = apellidosEmpleado,
        Empleados.sueldo = sueldo,
        Empleados.direccion = direccion,
        Empleados.turno = Empleados.turno
	where
		codigoCargoEmpleado = Empleados.codigoCargoEmpleado;
end $$
delimiter ;

call sp_actualizarEmpleados(1,'Hola','Mundo','25.0','11 Calle y 11 Avenida','V',2);

delimiter $$
create procedure sp_eliminarEmpleados(in codigoEmpleado int)
begin 
	delete from Empleados where Empleados.codigoEmpleado = codigoEmpleado;
end $$
delimiter ;

call sp_eliminarEmpleados(1);

delimiter $$
create procedure sp_agregarEmailProveedor(in codigoEmailProveedor int, in emailProveedor varchar(50), in descripcion varchar(100), in codigoProveedor int)
begin
	insert into EmailProveedor(codigoEmailProveedor, emailProveedor, descripcion, codigoProveedor)
    values(codigoEmailProveedor, emailProveedor, descripcion, codigoProveedor);
end $$
delimiter ;

call sp_agregarEmailProveedor(1,'dtubac@kinal','Guatemala',2);

delimiter $$
create procedure sp_listarEmailProveedor()
begin
	select * from EmailProveedor;
end $$
delimiter ;

call sp_listarEmailProveedor;

delimiter $$
create procedure sp_buscarEmailProveedor(in codigoEmailProveedor int)
begin
	select*from EmailProveedor where EmailProveedor.codigoEmailProveedor = codigoEmailProveedor;
end $$
delimiter ;

call sp_buscarEmailProveedor(1);

delimiter $$
create procedure sp_actualizarEmailProveedor(in codigoEmailProveedor int, in emailProveedor varchar(50), in descripcion varchar(100), in codigoProveedor int)
begin
	update EmailProveedor
	set
		EmailProveedor.emailProveedor = emailProveedor,
        EmailProveedor.descripcion = descripcion,
        EmailProveedor.codigoProveedor = codigoProveedor
	where
		EmailProveedor.codigoEmailProveedor = codigoEmailProveedor;
end $$
delimiter ;

call sp_actualizarEmailProveedor(1,'@gmail.com','Kinal',2);

delimiter $$
create procedure sp_eliminarEmailProveedor(in codigoEmailProveedor int)
begin
	delete from EmailProveedor where EmailProveedor.codigoEmailProveedor = codigoEmailProveedor;
end $$
delimiter ;

call sp_eliminarEmailProveedor(1);

delimiter $$
create procedure sp_agregarTelefonoProveedor(in codigoTelefonoProveedor int, in numeroPrincipal varchar(8), in numeroSecundario varchar(8), in observaciones varchar(45), in codigoProveedor int)
begin
	insert into TelefonoProveedor(codigoTelefonoProveedor, numeroPrincipal, numeroSecundario, observaciones, codigoProveedor)
    values (codigoTelefonoProveedor, numeroPrincipal, numeroSecundario, observaciones, codigoProveedor);
end $$
delimiter ;

call sp_agregarTelefonoProveedor(1,'12345678','87654321','502',2);

delimiter $$
create procedure sp_listarTelefonoProveedor()
begin
	select * from TelefonoProveedor;
end $$
delimiter ;

call sp_listarTelefonoProveedor;

delimiter $$
create procedure sp_buscarTelefonoProveedor(in codigoTelefonoProveedor int)
begin
	select * from TelefonoProveedor where TelefonoProveedor.codigoTelefonoProveedor = codigoTelefonoProveedor;
end $$
delimiter ;

call sp_buscarTelefonoProveedor(1);

delimiter $$
create procedure sp_actualizarTelefonoProveedor(in codigoTelefonoProveedor int, in numeroPrincipal varchar(8), in numeroSecundario varchar(8), in observaciones varchar(45), in codigoProveedor int)
begin
	update TelefonoProveedor
    set
		TelefonoProveedor.numeroPrincipal = numeroPrincipal,
        TelefonoProveedor.numeroSecundario = numeroSecundario, 
        TelefonoProveedor.observaciones = observaciones,
        TelefonoProveedor.codigoProveedor = codigoProveedor
	where 
		TelefonoProveedor.codigoTelefonoProveedor = codigoTelefonoProveedor;
end $$
delimiter ;

call sp_actualizarTelefonoProveedor(1,'09876543','12345678','025',2);

delimiter $$
create procedure sp_eliminarTelefonoProveedor(in codigoTelefonoProveedor int)
begin
	delete from TelefonoProveedor where TelefonoProveedor.codigoTelefonoProveedor = codigoTelefonoProveedor;
end $$
delimiter ;

call sp_eliminarTelefonoProveedor(1);