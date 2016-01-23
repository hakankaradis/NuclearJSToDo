View      = require '../view'
React     = require 'react'
expect    = require 'expect'
TestUtils = require 'react-addons-test-utils'
ShallowTestUtils = require 'react-shallow-testutils';

describe 'View Test', ->

	{ renderIntoDocument } = TestUtils

	describe '::render', ->

		it 'checks rendere modal props type', ->

			# modal = renderIntoDocument(<View />)

			renderer = TestUtils.createRenderer()
			renderer.render(<View />);

			modal = ShallowTestUtils.getMountedInstance(renderer)
			console.log modal

			expect(modal.props.query).toBeA 'string'
			expect(modal.props.changableText).toBeA 'string'
			expect(modal.props.handleCheckBox).toBeA 'function'
			expect(modal.props.handleAddClick).toBeA 'function'
			expect(modal.props.handleCheckChange).toBeA 'function'
			expect(modal.props.handleDeleteClick).toBeA 'function'
			expect(modal.props.handleInputChange).toBeA 'function'