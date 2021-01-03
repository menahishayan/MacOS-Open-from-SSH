const username = 'shayan'
const hostname = 'home.local'
const publicPath = '/home/shares/public/'
const userPath = '/home/'

function posixPath(finderWin) {
  return $.NSURL.alloc.initWithString(finderWin.target.url()).fileSystemRepresentation
}

var app = Application.currentApplication()
	app.includeStandardAdditions = true

var pathItems = posixPath(Application('Finder').finderWindows[0]).split("/")
pathItems.shift()
pathItems
if(pathItems[0] == "Volumes" && pathItems.length >= 3) {
		var remotePath = pathItems.slice(2).join("/").replace(" ", "\\ ");
		
		var Terminal = Application('Terminal');
		Terminal.activate();
		var targetWindow = Terminal.windows[0];
		Terminal.doScript(`ssh ${username}@${hostname} -t "cd ${pathItems[1] == "public" ? publicPath : userPath + pathItems[1]}/${remotePath}; bash --login"`, targetWindow);
} else {
	app.beep()
	var oAns = app.displayAlert(
	"Not A Network Folder",
	{
		message: "The folder you've selected is not on a remote volume. Please select a different folder.",
		as:  "critical",
		buttons: ['OK'],
		defaultButton: 1
	})
}