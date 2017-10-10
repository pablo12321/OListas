## Archivos:
- main.pas: Ejercicio a realizar.
- UOlista.pas: Unit con lo necesario para trabajar con listas.

## Tipo TPersona:
Es un registro que contiene la informacion que irá en cada nodo de la lista.
```pascal
type
TPersona = Record
  nombre:String;
  apellido:String;
  dni:String;
end;
```

## Tipo TNodo:
El tipo **TNodo** es un registro que contiene la informacion del elemento de la lista y dos punteros (**next** y **back**) que se utilizan para recorrer la lista.

```pascal
type
TNodo = Record
  info:TPersona;
  back,next:^TNodo;
end;
```

## Tipo Olista:
El tipo **OLista** es un tipo objeto para crear listas doblemente encadenadas, que tiene:
- Los punteros a **TNodo** '**q**' y '**u**' para el primer y ultimo elemento ficticio.
- Acciones '*Inicializar*', '*Mostrar*', '*Eliminar*', '*Insertar*'.
- Una función '*estaIinicializada*' para comprobar que la lista haya sido inicializada antes de realizad alguna acción.

```pascal
type
OLista = Object
  q,u:^TNodo;
  procedure Inicializar;
  function estaIinicializada:Boolean;
  procedure Insertar(info:TPersona);
  procedure Eliminar;
  procedure Mostrar;
end;
```

### Acción Iniciarlizar:
```pascal
procedure OLista.Inicializar;
```
Esta acción crea un elemento ficticio al comienzo y otro al final de la lista y los enlaza con los punteros que contiene cada nodo.

**Ejemplo:**
```pascal
Program Ejemplo1;
Uses UOlista;
Var lista:OLista;
Begin
  lista.Inicializar
End.
```

### Función estaIinicializada:
```pascal
function OLista.estaIinicializada:Boolean;
```
Devuelve verdadero si la lista fue inicializada o falso en caso contrario.

**Ejemplo:**
```pascal
Program Ejemplo2;
Uses UOlista;
Var lista:OLista;
Begin
  Writeln(lista.estaIinicializada);
  lista.Inicializar; // Inicializando lista.
  Writeln(lista.estaIinicializada)
End.
```
Esto devuelve...

```pascal
  FALSE
  // Inicializando lista.
  TRUE
```
### Acción Insertar:
Agrega un elemento pasado como parametro, al final de la lista.
```pascal
procedure OLista.Insertar(
  info:TPersona
);
```
**Ejemplo:**
```pascal
Program Ejemplo3;
Uses UOlista;
Var
  lista:OLista;
  persona:TPersona;
Begin
  lista.Inicializar;
  persona.nombre := "Juan";
  persona.apellido := "Perez";
  persona.dni := "35421512";
  lista.Insertar(persona)
End.
```

### Acción Mostrar:

Imprime en pantalla los elementos de la lista.
```pascal
procedure OLista.Mostrar;
```
**Ejemplo:**
```pascal
Program Ejemplo4;
Uses UOlista;
Var
  lista:OLista;
  persona:TPersona;
Begin
  lista.Inicializar;
  persona.nombre := "Juan";
  persona.apellido := "Perez";
  persona.dni := "35421512";
  lista.Insertar(persona);
  lista.Mostrar
End.
```
Esto devuelve...

```
  1) Nombre: Juan. Apellido: Perez. DNI: 35421512
```
### Acción Eliminar:

Elimina la cabeza de la lista(primer elemento).
```pascal
procedure OLista.Eliminar;
```
**Ejemplo:**
```pascal
Program Ejemplo5;
Uses UOlista;
Var
  lista:OLista;
  persona:TPersona;
Begin
  lista.Inicializar;
  persona.nombre := "Juan";
  persona.apellido := "Perez";
  persona.dni := "35421512";
  lista.Insertar(persona);
  lista.Mostrar;
  Writeln('Eliminando cabeza...');
  lista.Eliminar;
  lista.Mostrar //No devuelve nada
End.
```
Esto devuelve...

```
  1) Nombre: Juan. Apellido: Perez. DNI: 35421512
  Eliminando cabeza...
```
