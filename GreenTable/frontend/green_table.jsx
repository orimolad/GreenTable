import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';


document.addEventListener("DOMContentLoaded", () => {
    let store;
    if (window.currentUser) {
        const preloadedState = {
            session: {
                userId: window.currentUser.id,
                firstName: window.currentUser.firstName,
            }
        }
        store = configureStore(preloadedState);
        delete window.currentUser;
    } else {
        store = configureStore();
    }

    //testing
    window.getState = store.getState;
    //

    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);
});