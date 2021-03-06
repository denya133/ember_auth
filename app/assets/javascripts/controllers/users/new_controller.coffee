MealPlanner.UsersNewController = Ember.ObjectController.extend
  actions:
    createUser: () ->
      _this = @
      router = @get('target')
      data = @getProperties('username', 'email', 'password', 'password_confirmation')

      $.post '/users', { user: data }, (response) ->
        _this.store.push 'user', {
          id: response.api_key.user_id,
          username: data['username'],
          email: data['email'],
        }
        MealPlanner.AuthManager.authenticate(response.api_key.access_token, response.api_key.user_id, _this.get('store'))
        _this.set('model', _this.store.createRecord('user'));
        router.transitionTo('index')
        # _this.transitionToRoute('index')
