import 'package:flutter/material.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  String _searchText = '';
  String _selectedType = 'All';

  // Replace this list with actual article data fetched from Firebase
  List<Map<String, dynamic>> _articles = [
    {
      'title': 'Article 1',
      'type': 'Subject 1',
      'content': 'Content of article 1'
    },
    {
      'title': 'Article 2',
      'type': 'Subject 2',
      'content': 'Content of article 2'
    },
    // ...
  ];

  @override
  Widget build(BuildContext context) {
    final filteredArticles = _articles
        .where((article) =>
            (_selectedType == 'All' || article['type'] == _selectedType) &&
            article['title']
                .toString()
                .toLowerCase()
                .contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final searchText = await showSearch<String>(
                context: context,
                delegate: ArticleSearchDelegate(),
              );
              if (searchText != null) {
                setState(() {
                  _searchText = searchText;
                });
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: DropdownButton<String>(
              value: _selectedType,
              items: [
                DropdownMenuItem(value: 'All', child: Text('All')),
                // Add more items for each IB subject type
                DropdownMenuItem(value: 'Subject 1', child: Text('Subject 1')),
                DropdownMenuItem(value: 'Subject 2', child: Text('Subject 2')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredArticles.length,
              itemBuilder: (context, index) {
                final article = filteredArticles[index];
                return Card(
                  color: Colors.grey.shade300,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: InkWell(
                    onTap: () {
                      // TODO: navigate to article detail screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article['title'],
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            article['type'],
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Replace this list with actual article data fetched from Firebase
    List<Map<String, dynamic>> _articles = [
      {
        'title': 'Article 1',
        'type': 'Subject 1',
        'content': 'Content of article 1'
      },
      {
        'title': 'Article 2',
        'type': 'Subject 2',
        'content': 'Content of article 2'
      },
      // ...
    ];

    final suggestions = query.isEmpty
        ? _articles
        : _articles
            .where((article) => article['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final article = suggestions[index];
        return ListTile(
          title: Text(article['title']),
          subtitle: Text(article['type']),
          onTap: () {
            close(context, article['title']);
          },
        );
      },
    );
  }
}
