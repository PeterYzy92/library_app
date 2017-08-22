defmodule LibraryApp.UserView do
  use LibraryApp.Web, :view

  def panel_block do
  	"<div class='panel panel-primary'>
  		<div class='panel-heading'>TITLE</div>
  		<div class='panel-body'>
		  	 Im a panel
  		</div>

  	 </div>"
  end

end
