// =========================================================
// 🧠 Task Manager CLI en TypeScript
// =========================================================

import * as fs from "fs";

import * as readline from "readline";

// ========================
// Interfaces y Modelos
// ========================

interface ITask {
  id: number;
  title: string;
  completed: boolean;
}

class Task implements ITask {
  constructor(
    public id: number,
    public title: string,
    public completed: boolean = false
  ) {}

  toggle(): void {
    this.completed = !this.completed;
  }

  toString(): string {
    return `${this.id}|${this.title}|${this.completed}`;
  }

  static fromString(line: string): Task {
    const [id, title, completed] = line.split("|");
    return new Task(Number(id), title, completed === "true");
  }
}

// ========================
// Task Manager
// ========================

class TaskManager {
  private tasks: Task[] = [];
  private nextId: number = 1;

  constructor(private filename: string) {
    this.load();
  }

  addTask(title: string): void {
    const task = new Task(this.nextId++, title);
    this.tasks.push(task);
    console.log("✅ Tarea agregada.");
  }

  listTasks(): void {
    if (this.tasks.length === 0) {
      console.log("📭 No hay tareas.");
      return;
    }

    this.tasks.forEach(task => {
      const status = task.completed ? "[✔]" : "[ ]";
      console.log(`${status} ${task.id} - ${task.title}`);
    });
  }

  toggleTask(id: number): void {
    const task = this.tasks.find(t => t.id === id);
    if (!task) {
      console.log("❌ Tarea no encontrada.");
      return;
    }

    task.toggle();
    console.log("🔄 Estado actualizado.");
  }

  deleteTask(id: number): void {
    const index = this.tasks.findIndex(t => t.id === id);
    if (index === -1) {
      console.log("❌ Tarea no encontrada.");
      return;
    }

    this.tasks.splice(index, 1);
    console.log("🗑️ Tarea eliminada.");
  }

  save(): void {
    const data = this.tasks.map(t => t.toString()).join("\n");
    fs.writeFileSync(this.filename, data);
  }

  load(): void {
    if (!fs.existsSync(this.filename)) return;

    const lines = fs.readFileSync(this.filename, "utf-8").split("\n");

    lines.forEach(line => {
      if (!line.trim()) return;
      const task = Task.fromString(line);
      this.tasks.push(task);
      if (task.id >= this.nextId) {
        this.nextId = task.id + 1;
      }
    });
  }
}
// ========================
// CLI
// ========================

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const manager = new TaskManager("tasks.db");

function showMenu(): void {
  console.log("\n==============================");
  console.log("📝 TASK MANAGER");
  console.log("==============================");
  console.log("1. Agregar tarea");
  console.log("2. Listar tareas");
  console.log("3. Completar / Desmarcar tarea");
  console.log("4. Eliminar tarea");
  console.log("5. Salir");
  console.log("==============================");
}

function prompt(): void {
  showMenu();

  rl.question("Selecciona una opción: ", (option) => {
    switch (option.trim()) {
      case "1":
        rl.question("Título de la tarea: ", (title) => {
          if (title.trim()) {
            manager.addTask(title.trim());
            manager.save();
          } else {
            console.log("⚠️ El título no puede estar vacío.");
          }
          prompt();
        });
        break;

      case "2":
        manager.listTasks();
        prompt();
        break;

      case "3":
        rl.question("ID de la tarea: ", (id) => {
          const taskId = Number(id);
          if (!isNaN(taskId)) {
            manager.toggleTask(taskId);
            manager.save();
          } else {
            console.log("⚠️ ID inválido.");
          }
          prompt();
        });
        break;

      case "4":
        rl.question("ID de la tarea a eliminar: ", (id) => {
          const taskId = Number(id);
          if (!isNaN(taskId)) {
            manager.deleteTask(taskId);
            manager.save();
          } else {
            console.log("⚠️ ID inválido.");
          }
          prompt();
        });
        break;

      case "5":
        manager.save();
        console.log("👋 Saliendo...");
        rl.close();
        break;

      default:
        console.log("⚠️ Opción inválida.");
        prompt();
        break;
    }
  });
}

prompt();
