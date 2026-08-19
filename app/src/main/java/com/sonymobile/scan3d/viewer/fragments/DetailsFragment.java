package com.sonymobile.scan3d.viewer.fragments;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.format.Formatter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.fragment.app.DialogFragment;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.ModelContainer;
import java.io.File;
import java.text.DateFormat;
import java.text.NumberFormat;

/* JADX INFO: loaded from: classes2.dex */
public class DetailsFragment extends DialogFragment {
    private static final String ARG_DETAILS = "details";

    private static final class Details implements Parcelable {
        public static final Parcelable.Creator<Details> CREATOR = new Parcelable.Creator<Details>() { // from class: com.sonymobile.scan3d.viewer.fragments.DetailsFragment.Details.1
            @Override // android.os.Parcelable.Creator
            public Details createFromParcel(Parcel parcel) {
                return new Details(parcel);
            }
            @Override // android.os.Parcelable.Creator
            public Details[] newArray(int i) {
                return new Details[i];
            }
        };
        long fileSize;
        boolean isImproved;
        long timestamp;
        int triangleCount;
        int vertexCount;

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        public Details() {
        }

        protected Details(Parcel parcel) {
            this.timestamp = parcel.readLong();
            this.fileSize = parcel.readLong();
            this.triangleCount = parcel.readInt();
            this.vertexCount = parcel.readInt();
            this.isImproved = parcel.readInt() > 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeLong(this.timestamp);
            parcel.writeLong(this.fileSize);
            parcel.writeInt(this.triangleCount);
            parcel.writeInt(this.vertexCount);
            parcel.writeInt(this.isImproved ? 1 : 0);
        }
    }

    public static DetailsFragment newInstance(ModelContainer modelContainer, IFileSet iFileSet) {
        Details details = new Details();
        details.timestamp = iFileSet.getCreated().getTime();
        details.fileSize = new File(iFileSet.getZipFileUrl()).length();
        details.triangleCount = modelContainer.getFaceCount();
        details.vertexCount = modelContainer.getVertexCount();
        details.isImproved = iFileSet.isImprovement();
        DetailsFragment detailsFragment = new DetailsFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable(ARG_DETAILS, details);
        detailsFragment.setArguments(bundle);
        return detailsFragment;
    }

    @Override // androidx.fragment.app.DialogFragment
    @NonNull
    @SuppressLint({"InflateParams"})
    public Dialog onCreateDialog(Bundle bundle) {
        Details details = (Details) getArguments().getParcelable(ARG_DETAILS);
        View viewInflate = LayoutInflater.from(getContext()).inflate(R.layout.fragment_details, (ViewGroup) null, false);
        populateDetails(viewInflate, details);
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setTitle(R.string.details_fragment_title);
        builder.setView(viewInflate);
        builder.setPositiveButton(android.R.string.ok, (DialogInterface.OnClickListener) null);
        return builder.create();
    }

    private void populateDetails(View view, Details details) {
        NumberFormat numberInstance = NumberFormat.getNumberInstance();
        ((TextView) view.findViewById(R.id.created)).setText(getString(R.string.details_fragment_created, DateFormat.getDateInstance(3).format(Long.valueOf(details.timestamp))));
        ((TextView) view.findViewById(R.id.file_size)).setText(getString(R.string.details_fragment_filesize, Formatter.formatFileSize(getContext(), details.fileSize)));
        ((TextView) view.findViewById(R.id.triangle_count)).setText(getString(R.string.details_fragment_number_triangles, numberInstance.format(details.triangleCount)));
        ((TextView) view.findViewById(R.id.vertex_count)).setText(getString(R.string.details_fragment_number_vertices, numberInstance.format(details.vertexCount)));
        view.findViewById(R.id.is_improved).setVisibility(details.isImproved ? 0 : 8);
    }
}
