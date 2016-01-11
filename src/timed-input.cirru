
var
  React $ require :react

var
  ({}~ input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-avatar

  :propTypes $ {}
    :value React.PropTypes.string.isRequired
    :time React.PropTypes.number.isRequired
    :onChange React.PropTypes.func.isRequired
    :style React.PropTypes.object.isRequired
    :isEditable React.PropTypes.bool
    :placeholder React.PropTypes.string

  :getDefaultProps $ \ ()
    {} :isEditable true

  :getInitialState $ \ ()
    {} :value @props.value :time @props.time

  :onChange $ \ (event)
    if @props.isEditable $ do
      @setState $ {}
        :value event.target.value
        :time $ ... (new Date) (valueOf)
      @props.onChange event.target.value event
    , undefined

  :render $ \ ()
    var
      lastestValue $ cond (> @state.time @props.time) @state.value @props.value

    input $ {} :style @props.style :value lastestValue :onChange @onChange :placeholder @props.placeholder
