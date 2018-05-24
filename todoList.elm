import Html exposing (Html, button, div, text, input, label)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, type_)
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
                        (TodoList [ (Todo "THIS IS A TODO122222" False False 3 ), (Todo "THIS IS A 2nd thing in a list" False False 3 ) ] 
                        1 "THIS IS A TODOLIST2" )
                        ] }

--type alias todoListBackColor =


-- Update


type Msg = ToggleChecked
         | ChangeTodoPriority

update : Msg -> Model -> Model
update msg model =

  case msg of 
    ToggleChecked ->
      \todo -> { todo | done = not todo.done }
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
      input [ type_ "checkbox", onClick (ToggleChecked todo)] []
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















