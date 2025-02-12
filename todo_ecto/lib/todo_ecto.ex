defmodule TodoEcto do
  alias TodoEcto.{Repo, Task}
  import Ecto.Query

  def start do
    IO.puts("""
    1. Add a to-do
    2. List all to-dos
    3. Edit a to-do status
    4. Delete a to-do
    5. Exit
    """
    )
    case IO.gets("Choose an option:\s") |> String.trim() |> to_string do
      "1" ->
        add_task()
        start()
      "2" ->
        list_tasks()
      "3" ->
        update_task_status()
        start()
      "4" ->
        delete_task()
        start()
      "5" ->
        IO.puts("\nGoodbye! Have a nice time.\n")
        _ ->
        IO.puts("Invalid input")
        start()
    end
  end

  # Function to add a new task
  def add_task do
    new_task = IO.gets("Enter your task:\s") |> String.trim() |> to_string()
    changeset = Task.changeset(%Task{}, %{task: new_task})
    Repo.insert(changeset)
  end

  # Function to list all tasks
   def list_tasks do
    tasks = Repo.all(Task)
    Enum.each(tasks, fn task ->
      IO.puts("#{task.id}. #{String.capitalize(task.task)} - Status: #{task.status}")
    end)
    case IO.gets("\nType # to return back:\s") |> String.trim() |> to_string() do
      "#" ->
        start()
      _ ->
        IO.puts("Invalid input!")
    end
   end


  #Function to update task status
  def update_task_status do
    tasks = Repo.all(Task)
    Enum.each(tasks, fn task -> IO.puts("#{task.id}. #{String.capitalize(task.task)} - Status: #{task.status}") end)
    id = IO.gets("Enter task id to update:\s") |> String.trim() |> String.to_integer()
    new_status = IO.gets("New status:\s") |> String.trim() |> to_string

    task = Repo.get(Task, id)
    case task do
     nil  ->
     IO.puts("\nError! Task not found.\n")
      start()
      _ ->
        from(t in Task, where: t.id == ^id, update: [set: [status: ^new_status]])
        |> Repo.update_all([])
        start()
      end
  end

  # Function to delete a task
  def delete_task do
    tasks = Repo.all(Task)
    Enum.each(tasks, fn task -> IO.puts("#{task.id}. #{String.capitalize(task.task)} - Status: #{task.status}") end)
    id = IO.gets("\n Enter task id to delete: ") |> String.trim() |> String.to_integer()
    task = Repo.get(Task, id)

    case task do
      nil ->
        IO.puts("\nError! Task not found.\n")
      _ ->
        Repo.delete(task)
    end
  end
end
