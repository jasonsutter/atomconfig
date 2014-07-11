Tabclick = require '../lib/tabclick'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Tabclick", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('tabclick')

  describe "when the tabclick:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.tabclick')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'tabclick:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.tabclick')).toExist()
        atom.workspaceView.trigger 'tabclick:toggle'
        expect(atom.workspaceView.find('.tabclick')).not.toExist()
