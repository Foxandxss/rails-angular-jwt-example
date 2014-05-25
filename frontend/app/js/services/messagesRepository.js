angular.module('app')
    .factory('Messages', function($http) {
        return {
            getAll: function() {
                return $http.get('/api/messages');
            },
            create: function(message) {
                return $http.post('/api/messages', {body: message});
            },
            remove: function(message) {
                return $http.delete('/api/messages/' + message.id);
            }
        };
    });