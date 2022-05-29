#include <bits/stdc++.h>
using namespace std;
template<class Fun> class y_combinator_result {
  Fun fun_;
public:
  template<class T> explicit y_combinator_result(T &&fun): fun_(std::forward<T>(fun)) {}
  template<class ...Args> decltype(auto) operator()(Args &&...args) { return fun_(std::ref(*this), std::forward<Args>(args)...); }
};
template<class Fun> decltype(auto) y_combinator(Fun &&fun) { return y_combinator_result<std::decay_t<Fun>>(std::forward<Fun>(fun)); }
 
 
template<typename A, typename B> ostream& operator<<(ostream &os, const pair<A, B> &p) { return os << '(' << p.first << ", " << p.second << ')'; }
template<typename T_container, typename T = typename enable_if<!is_same<T_container, string>::value, typename T_container::value_type>::type> ostream& operator<<(ostream &os, const T_container &v) { os << '{'; string sep; for (const T &x : v) os << sep << x, sep = ", "; return os << '}'; }
 
void dbg_out() { cerr << endl; }
template<typename Head, typename... Tail> void dbg_out(Head H, Tail... T) { cerr << ' ' << H; dbg_out(T...); }
#ifdef LOCAL
#define debug(...) cerr << "(" << #__VA_ARGS__ << "):", dbg_out(__VA_ARGS__)
#else
#define debug(...)
#endif

int main()
{
  ios_base::sync_with_stdio(false);
  cin.tie(nullptr);
  auto gcd = y_combinator([](auto gcd, int a, int b) -> int {
      return b == 0 ? a : gcd(b, a % b);
  });
  cout << gcd(19, 57) << '\n';
  return 0;
}
