package androidx.databinding;

// AGP's DataBinding annotation processor normally generates this interface per-project
// (a marker listing instance-method @BindingAdapter classes; empty when there are none,
// as here). Soong never runs that processor, so it's hand-supplied here instead.
public interface DataBindingComponent {
}
