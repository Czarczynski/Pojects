import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  Text,
  Button,
  View,
  Alert,
} from 'react-native';

import {FontAwesomeIcon} from '@fortawesome/react-native-fontawesome';
import {faArrowLeft, faSignOutAlt} from '@fortawesome/free-solid-svg-icons';
import {connect} from 'react-redux';
import {logout} from '../actions/auth';
import {BG_COLOR, TEXT_COLOR, SMOKE_WHITE} from '../common/config';

function Header({title, navigation, logout}) {
  const logoutSubmit = () =>
    Alert.alert('Do you want to exit?', '', [
      {text: 'No', style: 'cancel'},
      {text: 'Yes', style: 'primary', onPress: () => logout()},
    ]);
  return (
    <SafeAreaView style={styles.appBar}>
      {navigation ? (
        <FontAwesomeIcon
          style={styles.arrow}
          icon={faArrowLeft}
          size={25}
          onPress={() => navigation.goBack()}
        />
      ) : (
        <View style={styles.placeholder}></View>
      )}
      <View>
        <Text style={styles.title}>{title}</Text>
      </View>
      <FontAwesomeIcon
        style={styles.arrow}
        icon={faSignOutAlt}
        size={25}
        onPress={() => logoutSubmit()}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  appBar: {
    height: 110,
    flexDirection: 'row',
    backgroundColor: BG_COLOR,
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  title: {
    color: TEXT_COLOR,
    fontWeight: '500',
    fontSize: 30,
  },
  arrow: {
    color: TEXT_COLOR,
    marginHorizontal: 20,
    paddingHorizontal: 20,
  },
  placeholder: {
    paddingVertical: 14,
    paddingHorizontal: 20,
    marginHorizontal: 20,
  },
});

const mapStateToProps = (state) => ({});

export default connect(mapStateToProps, {logout})(Header);
