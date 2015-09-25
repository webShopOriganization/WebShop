/**
 * The examples provided by Facebook are for non-commercial testing and
 * evaluation purposes only.
 *
 * Facebook reserves all rights not expressly granted.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL
 * FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * @flow
 */
'use strict';

var React = require('react-native');
var {
  Image,
  PixelRatio,
  ScrollView,
  StyleSheet,
  Text,
  View,
} = React;

var getImageSource = require('./getImageSource');
var getStyleFromScore = require('./getStyleFromScore');
var getTextFromScore = require('./getTextFromScore');

var MovieScreen = React.createClass({
  render: function() {
    return (
      <ScrollView contentContainerStyle={styles.contentContainer}>
        <View style={styles.mainSection}>
          {/* $FlowIssue #7363964 - There's a bug in Flow where you cannot
            * omit a property or set it to undefined if it's inside a shape,
            * even if it isn't required */}
          <Image
            source={{uri: this.props.movie.posters.thumbnail}}
            style={styles.detailsImage}
          />
          <View style={styles.rightPane}>
            <Text style={styles.movieTitle}>{this.props.movie.title}</Text>
            <Text>上架时间{this.props.movie.year}</Text>
            <View style={styles.mpaaWrapper}>
              <Text style={styles.movieTitle}>
                价格：{'￥100.00'}
              </Text>
            </View>
            <Ratings ratings={100} />
          </View>
        </View>
        <View style={styles.separator} />
        <Text>
          {'商品参数'}
        </Text>
        <View style={styles.separator} />
        <Cast actors={'actors'} />
      </ScrollView>
    );
  },
});

var Ratings = React.createClass({
  render: function() {
    var criticsScore = this.props.ratings.critics_score;
    var audienceScore = this.props.ratings.audience_score;

    return (
      <View>
        <View style={styles.rating}>
          <Text style={styles.ratingTitle}>好评率:</Text>
          <Text style={getStyleFromScore(criticsScore)}>
            {'90%'}
          </Text>
        </View>
        <View style={styles.rating}>
          <Text style={styles.ratingTitle}>服  务:</Text>
          <Text style={getStyleFromScore(audienceScore)}>
            {'支持货到付款'}
          </Text>
        </View>
      </View>
    );
  },
});

var Cast = React.createClass({
  render: function() {
    if (!this.props.actors) {
      return null;
    }

    return (
      <View>
        <Text style={styles.castTitle}>商品评论</Text>
        
       
      </View>
    );
  },
});

var styles = StyleSheet.create({
  contentContainer: {
    padding: 10,
  },
  rightPane: {
    justifyContent: 'space-between',
    flex: 1,
  },
  movieTitle: {
    flex: 1,
    fontSize: 16,
    fontWeight: '500',
  },
  rating: {
    marginTop: 10,
  },
  ratingTitle: {
    fontSize: 14,
  },
  ratingValue: {
    fontSize: 28,
    fontWeight: '500',
  },
  mpaaWrapper: {
    alignSelf: 'flex-start',
    borderColor: 'black',
    borderWidth: 1,
    paddingHorizontal: 3,
    marginVertical: 5,
  },
  mpaaText: {
    fontFamily: 'Palatino',
    fontSize: 13,
    fontWeight: '500',
  },
  mainSection: {
    flexDirection: 'row',
  },
  detailsImage: {
    width: 134,
    height: 200,
    backgroundColor: '#eaeaea',
    marginRight: 10,
  },
  separator: {
    backgroundColor: 'rgba(0, 0, 0, 0.1)',
    height: 1 / PixelRatio.get(),
    marginVertical: 10,
  },
  castTitle: {
    fontWeight: '500',
    marginBottom: 3,
  },
  castActor: {
    marginLeft: 2,
  },
});

module.exports = MovieScreen;
