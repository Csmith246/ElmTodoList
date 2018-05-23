import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import List


main = Html.beginnerProgram { model=model, view=view, update=update }

-- Model


type alias Todo = 
  { content : String
  , done : Bool
  , important : Bool
  , priority : Int
  }

type alias TodoList =
  { todos : List Todo
  , priority : Int
  , name : String
  }

type alias Model = 
  { todoLists : List TodoList
  }

model : Model
model = { todoLists = [ (TodoList [ (Todo "THIS IS A TODO" False False 3 ) ] 1 "THIS IS A TODOLIST" ),
                        (TodoList [ (Todo "THIS IS A TODO122222" False False 3 ), (Todo "THIS IS A 2nd thing in a list" False False 3 ) ] 1 "THIS IS A TODOLIST2" )
                        ] }

type alias todoListBackColor =


-- Update


type Msg = ToggleChecked
         | ChangePriority
         | 

update : Msg -> Model -> Model
update msg model =
  model
{-
  case msg of 
    ToggleChecked ->
      
--      not model.todoLists.todos.priority
    ChangePriority ->
--      model.todoLists
-}

-- View


view : Model -> Html Msg
view model = 
  div []
    [ div [] [ text "TodoList App"]
    , div [] (List.map listTodoList model.todoLists)
    ]

listTodoList : TodoList -> Html Msg
listTodoList todoList = 
  div [] 
  [ div [] [text ("List Name" ++ todoList.name)]
  , div [] (List.map listTodos todoList.todos)
  ]
    
listTodos : Todo -> Html Msg
listTodos todo = 
  div [] 
    [ div [] [text todo.content]
    ]






