import Html exposing (Html, button, div, text, input, label)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, type_)
import List
import Debug


main = Html.beginnerProgram { model=model, view=view, update=update }

-- Model


type alias Todo = 
  { id : Int
  , content : String
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
model = { todoLists = [ (TodoList [ (Todo 1 "THIS IS A TODO" False False 3 ) ] 1 "THIS IS A TODOLIST" ),
                        (TodoList [ (Todo 2 "THIS IS A TODO122222" False False 3 ), (Todo 3 "THIS IS A 2nd thing in a list" False False 3 ) ] 
                        1 "THIS IS A TODOLIST2" )
                        ] }

--type alias todoListBackColor =


-- Update


type Msg = ToggleChecked Int
        -- | ChangeTodoPriority

update : Msg -> Model -> Model
update msg model =
  
  case msg of 
    ToggleChecked todoId ->
      { model | todoLists = (List.map (\todoList -> {todoList | todos = List.map (\todo -> if todo.id == todoId then { todo | done = not todo.done } else todo) todoList.todos } ) model.todoLists)}
{-    ChangeTodoPriority ->
      \todo newPriority -> { todo | priotity = newPriority }
-}

-- View


view : Model -> Html Msg
view model = 
  div [ flexStyle ]
    [ div [] [ text "TodoList App"]
    , div [] (List.map listTodoList model.todoLists)
    ]

listTodoList : TodoList -> Html Msg
listTodoList todoList = 
  div [ marginSpacing ] 
  [ div [ listHeader ] [text (todoList.name)]
  , div [] (List.map listTodos todoList.todos)
  ]
    
listTodos : Todo -> Html Msg
listTodos todo = 
  div [] 
    [ label [] [
      input [ type_ "checkbox", onClick (ToggleChecked todo.id) ] []
      , text todo.content
      ]
    ]


-- Styles

flexStyle : Html.Attribute msg
flexStyle =
  style
    [ ("display", "flex")
    , ("flex-direction", "column")
    , ("justify-content", "center")
    , ("align-items", "center")
    , ("height", "100%")
    ]

listHeader : Html.Attribute msg
listHeader = 
  style 
    [ ("font-weight", "bold")
    ]

marginSpacing : Html.Attribute msg
marginSpacing = 
  style
    [ ("margin", "10px") 
    ]















