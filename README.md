# Tarea 7 — Limpieza de commits en Git (Rebase Interactivo)

## 1. Introducción
En esta tarea se practica la reescritura del historial de Git utilizando `git rebase -i`.  
El objetivo es mejorar la claridad del historial, corregir mensajes poco descriptivos y fusionar commits innecesarios.

---

## 2. Creación de commits iniciales
Para generar un historial que pudiera ser limpiado posteriormente, se crearon tres commits con mensajes poco claros.  
Estos commits se realizaron modificando el archivo `README.md`:

```
echo "Primer contenido del README" > README.md
git add README.md
git commit -m "cambios"

echo "Segunda línea" >> README.md
git add README.md
git commit -m "arreglos"

echo "Tercera línea" >> README.md
git add README.md
git commit -m "cosas"
```

---

## 3. Rebase interactivo
Para reescribir los últimos 3 commits se ejecutó:

```
git rebase -i HEAD~3
```

Esto abrió el editor interactivo con la lista de commits.  
Se aplicaron las siguientes acciones:

- `reword` para mejorar mensajes poco descriptivos.
- `squash` para fusionar commits que no aportaban valor por separado.
- `pick` para mantener commits que no necesitaban cambios.

Ejemplo de configuración en el editor:

```
pick   a1b2c3c cambios
squash d4e5f6g arreglos
squash h7i8j9k cosas
```

Git abrió un editor adicional para escribir un mensaje final más claro y coherente, por ejemplo:

```
Mejoras en la documentación del proyecto Terraform
```

---

## 4. Actualización del historial remoto
Como el rebase modifica el historial local, fue necesario forzar la actualización del repositorio remoto:

```
git push origin main --force
```

Esto reemplazó el historial anterior por el nuevo historial limpio.

---

## 5. Resultado final
El historial remoto quedó corregido, con:

- Mensajes claros y descriptivos.
- Commits innecesarios fusionados.
- Un historial más coherente y fácil de entender.

