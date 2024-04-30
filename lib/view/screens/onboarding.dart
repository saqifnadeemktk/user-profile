import 'package:flutter/material.dart';
 import 'package:lottie/lottie.dart';



class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildOnBoardingPage(
                title: 'Providers',
                description: 'Discover and connect with reliable providers for your POS system.',
                image: 'https://cdnl.iconscout.com/lottie/premium/preview-watermark/global-marketing-10576979-8542543.mp4',
              ),
              _buildOnBoardingPage(
                title: 'Shopkeepers',
                description: 'Manage your store efficiently with our POS system.',
                image: 'https://images.unsplash.com/photo-1570841054287-c0c4f1829b36?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
              _buildOnBoardingPage(
                title: 'Drivers',
                description: 'Streamline your delivery operations with our POS system.',
                image: 'https://images.unsplash.com/photo-1554961650-cdbd896f1e18?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
              _buildOnBoardingPage(
                title: 'Customers',
                description: 'Provide a seamless shopping experience for your customers.',
                image: 'https://plus.unsplash.com/premium_photo-1658506871173-7498f5371ed1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
            ],
          ),
          Positioned(
            top: 50.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Welcome to our App',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Explore our features and get started',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _currentPage > 0
                    ? TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text('PREV'),
                      )
                    : SizedBox.shrink(),
                SizedBox(width: 16.0),
                PageIndicator(
                  controller: _pageController,
                  itemCount: 4,
                  currentIndex: _currentPage,
                ),
                SizedBox(width: 16.0),
                TextButton(
                  onPressed: () {
                    if (_currentPage == 3) {
                      // Navigate to the next screen
                      Navigator.pushNamed(context, '/main');
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(_currentPage == 3 ? 'FINISH' : 'NEXT'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnBoardingPage({
    required String title,
    required String description,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              image,
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final int itemCount;
  final int currentIndex;

  PageIndicator({
    required this.controller,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        itemCount,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: GestureDetector(
            onTap: () {
              controller.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == currentIndex
                    ? Theme.of(context).primaryColor
                    : Colors.grey[400],
              ),
            ),
          ),
        ),
      ),
    );
  }
}